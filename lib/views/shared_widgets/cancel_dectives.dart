import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandobaswaaq/views/shared_widgets/traditional_text_form_field.dart';

import '../../logic/logic_cubit.dart';
import '../../utils/helpers.dart';
import '../../utils/style.dart';
import 'custom_dropdownbutton_widget.dart';

class CancelDeactivate extends StatefulWidget {
  final int projectId;

  const CancelDeactivate({super.key, required this.projectId});

  @override
  State<CancelDeactivate> createState() => _CancelDeactivateState();
}

class _CancelDeactivateState extends State<CancelDeactivate> {
  final resonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'سيصل تعليقك للجهة المسئوله',
                  style: TextStyle(
                      color: MyColors.primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropDownButton(
                    initialValue:
                        LogicCubit.get(context).initialcancelDeactivate,
                    itemList: LogicCubit.get(context).listcancelDeactivate,
                    onChange: (value) {
                      setState(() {
                        LogicCubit.get(context).initialcancelDeactivate = value;
                      });
                    }),
              ),
              SizedBox(
                height: 5.h,
              ),
              LogicCubit.get(context).initialcancelDeactivate == "اختار سبب" ||
                      LogicCubit.get(context).initialcancelDeactivate != "اخري"
                  ? const SizedBox()
                  : TraditionalTextFormField(
                      hintText: 'اكتب سبب',
                      textInputType: TextInputType.text,
                      controller: resonController),
              SizedBox(
                height: 5.h,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: MyColors.redColor,
                        child: TextButton(
                          child: Text(
                            'إلغاء',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: TextButton(
                          child: Text(
                            'أرسل التعليق',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                          onPressed: () async {
                            if (LogicCubit.get(context)
                                        .initialcancelDeactivate ==
                                    "اختار سبب" &&
                                resonController.text.isEmpty||
                                LogicCubit.get(context).initialcancelDeactivate ==
                                        "اخري" &&
                                    resonController.text.isEmpty) {
                              MyHelpers.showSnackBar(
                                  "برجاء اختر سبب الالغاء", "error");
                            } else {
                              MyHelpers.confrimAwesomeDialog(
                                  context: context,
                                  btnOkText: "تاكيد",
                                  btnCancelText: "الغاء",
                                  btnOkOnPress: () {
                                    LogicCubit.get(context).cancelDeactivate(
                                        idDeactivate: widget.projectId,
                              
                                        note: LogicCubit.get(context)
                                                    .initialcancelDeactivate ==
                                                "اخري"
                                            ? resonController.text
                                            : LogicCubit.get(context)
                                                .initialcancelDeactivate,
                                            );
                                  });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ));
  }
}
