// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandobaswaaq/views/screens/orders_view/deactivate_screens/widget/deactive_details_item.dart';
import '../../../../data/model/allDeactivateRepresentative_model.dart';
import '../../../../logic/logic_cubit.dart';
import '../../../../logic/logic_state.dart';
import '../../../../utils/helpers.dart';
import '../../../../utils/style.dart';
import '../../../shared_widgets/cancel_dectives.dart';
import '../../../shared_widgets/show_loading_indicator_f.unction.dart';
import '../orders_representative_screen.dart';

class DetailsDeactivatesScreen extends StatelessWidget {
  final DeactivateRepresentative deactivates;
  final int idDeactivate;

  DetailsDeactivatesScreen({
    Key? key,
    required this.deactivates,
    required this.idDeactivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {
        if (state is DoneDeactivateLoading) {
          showLoadingIndicator(context);
        }

        if (state is DoneDeactivateSuccess) {
          Get.back();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
          LogicCubit.get(context).initialorderReturned == "اختار سبب";
          MyHelpers.showSnackBar("تم حل العطل بنجاح", "alaram");
        }
        if (state is DoneDeactivateFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا اثناء حل العطل", "error");
        }

        if (state is CancelDeactivateLoading) {
          showLoadingIndicator(context);
        }

        if (state is CancelDeactivateSuccess) {
          Get.back();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
          LogicCubit.get(context).initialorderReturned == "اختار سبب";
          MyHelpers.showSnackBar("تم الغاء العطل بنجاح", "alaram");
        }
        if (state is CancelDeactivateFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا اثناء الغاء العطل", "error");
        }
      },
      builder: (context, state) {
        var cubit = LogicCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                color: MyColors.primaryColor,
              ),
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.whiteColor,
              elevation: 0.0,
              centerTitle: true,
              title: const Text(
                'تفاصيل العطل',
                style: TextStyle(
                  color: MyColors.blackColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  DeactiveDetailsItem(
                    deactivatesItem: deactivates,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 20.w,
                            end: 20.w,
                            bottom: 20.h,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              MyHelpers.confrimAwesomeDialog(
                                  context: context,
                                  btnOkText: "تاكيد",
                                  btnCancelText: "الغاء",
                                  btnOkOnPress: () {
                                    cubit.doneDeactivate(
                                        idDeactivate: idDeactivate);
                                  });
                            },
                            child: Text(
                              'حل العطل',
                              style: TextStyle(
                                color: MyColors.whiteColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20.sp,
                              ),
                            ),
                            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                            color: MyColors.primaryColor,
                            splashColor: MyColors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 20.w,
                            end: 20.w,
                            bottom: 20.h,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              AwesomeDialog(
                                  context: context,
                                  animType: AnimType.scale,
                                  dialogType: DialogType.noHeader,
                                  body: CancelDeactivate(
                                    projectId: idDeactivate,
                                  )).show();
                            },
                            child: Text(
                              'الغاء العطل',
                              style: TextStyle(
                                color: MyColors.whiteColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20.sp,
                              ),
                            ),
                            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                            color: MyColors.primaryColor,
                            splashColor: MyColors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
