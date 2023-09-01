import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandobaswaaq/views/shared_widgets/traditional_text_form_field.dart';

import '../../logic/logic_cubit.dart';
import '../../utils/helpers.dart';
import '../../utils/style.dart';
import 'custom_dropdownbutton_widget.dart';

class AllRetrunWidget extends StatefulWidget {
  final int projectId;

  const AllRetrunWidget({super.key, required this.projectId});

  @override
  State<AllRetrunWidget> createState() => _AllRetrunWidgetState();
}

class _AllRetrunWidgetState extends State<AllRetrunWidget> {
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
                    initialValue: LogicCubit.get(context).initialorderReturned,
                    itemList: LogicCubit.get(context).listorderReturned,
                    onChange: (value) {
                      setState(() {
                        LogicCubit.get(context).initialorderReturned = value;
                      });
                    }),
              ),
              SizedBox(
                height: 5.h,
              ),
              LogicCubit.get(context).initialorderReturned == "اختار سبب" ||
                      LogicCubit.get(context).initialorderReturned != "اخري"
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
                            if (LogicCubit.get(context).initialorderReturned ==
                                        "اختار سبب" &&
                                    resonController.text.isEmpty ||
                                LogicCubit.get(context).initialorderReturned ==
                                        "اخري" &&
                                    resonController.text.isEmpty) {
                              MyHelpers.showSnackBar(
                                  "برجاء اختر سبب الاسترجاع", "error");
                            } else {
                              MyHelpers.confrimAwesomeDialog(
                                  context: context,
                                  btnOkText: "تاكيد",
                                  btnCancelText: "الغاء",
                                  btnOkOnPress: () {
                                    LogicCubit.get(context).orderReturned(
                                      idProject: widget.projectId,
                                      note: LogicCubit.get(context)
                                                  .initialorderReturned ==
                                              "اخري"
                                          ? resonController.text
                                          : LogicCubit.get(context)
                                              .initialorderReturned,
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
