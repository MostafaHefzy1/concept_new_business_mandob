import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mandobaswaaq/views/shared_widgets/traditional_text_form_field.dart';

import '../../logic/logic_cubit.dart';
import '../../utils/helpers.dart';
import '../../utils/style.dart';
import 'custom_dropdownbutton_widget.dart';

class CancelCollectingWidget extends StatefulWidget {
  final int projectId;
  final String dateDelay;
  CancelCollectingWidget(
      {super.key, required this.projectId, required this.dateDelay});

  @override
  State<CancelCollectingWidget> createState() => _CancelCollectingWidgetState();
}

class _CancelCollectingWidgetState extends State<CancelCollectingWidget> {
  var noteController = TextEditingController();
  final resonController = TextEditingController();

  String? dateController;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.dateDelay.toString())
        .add(const Duration(hours: 24));
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
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: dateTime,
                          firstDate: dateTime,
                          lastDate: DateTime(2040))
                      .then((value) {
                    setState(() {
                      dateController = value.toString().substring(0, 10);
                    });
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.dashColor, width: 1.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      dateController == null
                          ? Text("تاريخ التاجيل",
                              style: TextStyle(
                                  color: MyColors.primaryColor,
                                  fontSize: 11.sp))
                          : Text(
                              "  $dateController ",
                              style: TextStyle(
                                  color: MyColors.primaryColor,
                                  fontSize: 11.sp),
                            ),
                      const Spacer(),
                      const Icon(FontAwesomeIcons.calendarDays,
                          color: MyColors.primaryColor),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropDownButton(
                    initialValue:
                        LogicCubit.get(context).initialcancelCollecting,
                    itemList: LogicCubit.get(context).listcancelCollecting,
                    onChange: (value) {
                      setState(() {
                        LogicCubit.get(context).initialcancelCollecting = value;
                      });
                    }),
              ),
              SizedBox(
                height: 5.h,
              ),
              LogicCubit.get(context).initialcancelCollecting == "اختار سبب" ||
                      LogicCubit.get(context).initialcancelCollecting != "اخري"
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
                            if (dateController == null) {
                              MyHelpers.showSnackBar(
                                  "برجاء اختيار موعد التاجيل", "error");
                            } else if (LogicCubit.get(context)
                                        .initialcancelCollecting ==
                                    "اختار سبب" &&
                                resonController.text.isEmpty||
                                LogicCubit.get(context).initialcancelCollecting ==
                                        "اخري" &&
                                    resonController.text.isEmpty) {
                              MyHelpers.showSnackBar(
                                  "برجاء اختر سبب التاجيل", "error");
                            } else {
                              MyHelpers.confrimAwesomeDialog(
                                  context: context,
                                  btnOkText: "تاكيد",
                                  btnCancelText: "الغاء",
                                  btnOkOnPress: () {
                                    LogicCubit.get(context).cancelCollecting(
                                        note: LogicCubit.get(context)
                                                    .initialcancelCollecting ==
                                                "اخري"
                                            ? resonController.text
                                            : LogicCubit.get(context)
                                                .initialcancelCollecting,
                                        idCollecting: widget.projectId,
                                        collectingDelay: widget.dateDelay);
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
