import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/helpers.dart';
import '../../utils/style.dart';
import '../shared_widgets/button_text_icon.dart';
import '../shared_widgets/traditional_text_form_field.dart';
import '../shared_widgets/underline_row.dart';
import '../../logic/logic_cubit.dart';
import '../../logic/logic_state.dart';
import '../../utils/shared_preferences.dart';
import '../shared_widgets/show_loading_indicator_f.unction.dart';
import 'orders_view/orders_representative_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) async {
        if (state is LoginLoadingState) {
          showLoadingIndicator(context);
        }
        if (state is LoginSuccessState) {
          await CashHelper.saveData(
              key: "idRepresentative", value: (state.userDataSuccessModel.user!.id));
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
        }
        if (state is LoginFailedState) {
          Navigator.pop(context);
          MyHelpers.showSnackBar(
              "رقم الهاتف / كلمة المرور الخاصة بك خاطئة", "error");
        }
      },
      builder: (context, state) {
        var cubit = LogicCubit.get(context);
        return Scaffold(
            body: SingleChildScrollView(
          child: WillPopScope(
            onWillPop: () async {
              return MyHelpers.closeAppDialog(context);
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: MyColors.primaryColor,
                  ),
                  Positioned(
                    top: 200.h,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.bodyColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          topLeft: Radius.circular(30.r),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.w),
                        margin: EdgeInsets.only(top: 50.h),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const UnderlineRow(),
                              SizedBox(
                                height: 20.h,
                              ),
                              TraditionalTextFormField(
                                hintText: 'رقم الهاتف',
                                textInputType: TextInputType.phone,
                                controller: phoneController,
                                maxLength: 11,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  }
                                  if (value.length < 11) {
                                    return 'رقم الموبايل يجب ان يتكون من ١١ رقم';
                                  }

                                  String check = value.substring(0, 3);
                                  if (check != '010' &&
                                      check != '012' &&
                                      check != '011' &&
                                      check != '015') {
                                    return 'يجب أدخال رقم هاتف صالح';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TraditionalTextFormField(
                                suffix: cubit.suffix,
                                suffixPressed: () {
                                  cubit.isShowAndHidePassWord();
                                },
                                isPassword: cubit.isShow,
                                hintText: 'كلمة المرور',
                                textInputType: TextInputType.text,
                                controller: passwordController,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  } else if (value.length < 8) {
                                    return 'كلمة المرور يجب الا تقل عن ٨ ارقام';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomMaterialButton(
                                background: MyColors.primaryColor,
                                topLeftRadius: 8.r,
                                topRightRadius: 8.r,
                                bottomLeftRadius: 8.r,
                                bottomRightRadius: 8.r,
                                width: 200.w,
                                height: 40.h,
                                pressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                        context: context);
                                  }
                                },
                                text: 'تسجيل الدخول',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120.h,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 5.r, color: MyColors.primaryColor),
                      ),
                      width: 150.w,
                      height: 150.h,
                      child: CircleAvatar(
                        backgroundColor: MyColors.whiteColor,
                        child: SvgPicture.asset(
                          'assets/images/verify.svg',
                          color: MyColors.primaryColor,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
