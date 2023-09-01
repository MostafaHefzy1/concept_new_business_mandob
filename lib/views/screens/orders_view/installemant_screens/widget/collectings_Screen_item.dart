// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../data/model/allCollectingRepresentative_model.dart';
import '../../../../../logic/logic_cubit.dart';
import '../../../../../utils/style.dart';
import '../../../../shared_widgets/button_text_icon.dart';
import '../details_collectings_screen.dart';

class InstallemantItem extends StatelessWidget {
  final CollectingRepresentative collectingRepresentative;
  final int index;

  const InstallemantItem(
      {super.key, required this.collectingRepresentative, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsCollectingsScreen(
                      delayDate:
                          collectingRepresentative.collectingDate.toString(),
                      idOrder: collectingRepresentative.id!,
                      orderItem: collectingRepresentative.order!.orderItems!,
                    )));
      },
      child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 2.h,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            border: Border.all(
              color: MyColors.greyColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "رقم الطلب : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${collectingRepresentative.id}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "اسم العميل : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${collectingRepresentative.order!.user!.name}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'العنوان : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${collectingRepresentative.order!.user!.address}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'تاريخ التحصيل : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${collectingRepresentative.collectingDate}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'قيمه المبلغ المطلوب : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${collectingRepresentative.value}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'قيمه المبلغ المتبقي : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${collectingRepresentative.remain}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor),
                          ),
                        ],
                      ),
                      collectingRepresentative.notes == null
                          ? SizedBox()
                          : SizedBox(
                              height: 10.h,
                            ),
                      collectingRepresentative.notes == null
                          ? SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'ملاحظات : ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ("${collectingRepresentative.notes}"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primaryColor),
                                ),
                              ],
                            ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 50.sp,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: MaterialButton(
                  onPressed: () {
                    LogicCubit.get(context).goToMaps(
                      latitude:
                          "${collectingRepresentative.collectingDate.user!.goeLocation!.split(",").first}",
                      longitude:
                          "${collectingRepresentative.collectingDate.user!.goeLocation!.split(",").last}",
                    );
                  },
                  child: Text(
                    'الموقع',
                    style: TextStyle(
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                  minWidth: double.infinity,
                  color: MyColors.primaryColor,
                  splashColor: MyColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
