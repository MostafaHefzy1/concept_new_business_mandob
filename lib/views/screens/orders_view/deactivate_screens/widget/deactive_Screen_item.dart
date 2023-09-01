// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/model/allDeactivateRepresentative_model.dart';
import '../../../../../logic/logic_cubit.dart';
import '../../../../../utils/style.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared_widgets/button_text_icon.dart';
import '../details_deactivates_screen.dart';

class DeactiveItem extends StatelessWidget {
  final DeactivateRepresentative deactivateRepresentative;
  final int index;

  const DeactiveItem(
      {super.key, required this.deactivateRepresentative, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsDeactivatesScreen(
                      deactivates: deactivateRepresentative,
                      idDeactivate: deactivateRepresentative.id!,
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
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "رقم الطلب : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${deactivateRepresentative.id}",
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
                    "${deactivateRepresentative.user!.name}",
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
                    "${deactivateRepresentative.user!.address}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryColor),
                  ),
                ],
              ),
              deactivateRepresentative.type == null
                  ? SizedBox()
                  : SizedBox(
                      height: 10.h,
                    ),
              deactivateRepresentative.type == null
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'نوع العطل : ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ("${deactivateRepresentative.type}"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primaryColor),
                        ),
                      ],
                    ),
              deactivateRepresentative.description == null
                  ? SizedBox()
                  : SizedBox(
                      height: 10.h,
                    ),
              deactivateRepresentative.description == null
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'وصف العطل : ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ("${deactivateRepresentative.description}"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.primaryColor),
                        ),
                      ],
                    ),
              deactivateRepresentative.notes == null
                  ? SizedBox()
                  : SizedBox(
                      height: 10.h,
                    ),
              deactivateRepresentative.notes == null
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'ملاحظات علي العطل : ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ("${deactivateRepresentative.notes}"),
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
                Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: MaterialButton(
                onPressed: () {
                  LogicCubit.get(context).goToMaps(
                    latitude:
                        "${deactivateRepresentative.user!.goeLocation!.split(",").first}",
                    longitude:
                        "${deactivateRepresentative.user!.goeLocation!.split(",").last}",
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     const Text(
              //       'اسم الفرع : ',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     Text(
              //       ("${deactivateRepresentative.user!.area!.store!.nameAr}"),
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: MyColors.primaryColor),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     const Text(
              //       'رقم هاتف الفرع 1  : ',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         launch(
              //             'tel:${deactivateRepresentative.user!.area!.store!.firstPhone}');
              //       },
              //       child: Text(
              //         ("${deactivateRepresentative.user!.area!.store!.firstPhone}"),
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             color: MyColors.primaryColor),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // deactivateRepresentative.user!.area!.store!.secondPhone ==
              //         null
              //     ? SizedBox()
              //     : Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           const Text(
              //             'رقم هاتف الفرع 2  : ',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           InkWell(
              //             onTap: () {
              //               launch(
              //                   'tel:${deactivateRepresentative.user!.area!.store!.secondPhone}');
              //             },
              //             child: Text(
              //               ("${deactivateRepresentative.user!.area!.store!.secondPhone}"),
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   color: MyColors.primaryColor),
              //             ),
              //           ),
              //         ],
              //       ),
           
              // Row(
              //   children: [
              //     CustomMaterialButton(
              //       width: 40.w,
              //       background: MyColors.primaryColor,
              //       topLeftRadius: 4.r,
              //       topRightRadius: 4.r,
              //       bottomLeftRadius: 4.r,
              //       bottomRightRadius: 4.r,
              //       pressed: () {
              //         launch(
              //             'tel:${deactivateRepresentative.user!.area!.store!.firstPhone}');
              //       },
              //         text: ' رقم هاتف الفرع 1   ',
              //     ),
              //     SizedBox(
              //       width: 8.w,
              //     ),
              //   deactivateRepresentative.user!.area!.store!.secondPhone == null
              //         ? SizedBox()
              //         : CustomMaterialButton(
              //             width: 40.w,
              //             background: MyColors.primaryColor,
              //             topLeftRadius: 4.r,
              //             topRightRadius: 4.r,
              //             bottomLeftRadius: 4.r,
              //             bottomRightRadius: 4.r,
              //             pressed: () {
              //               launch(
              //                   'tel:${deactivateRepresentative.user!.area!.store!.secondPhone}');
              //             },
              //         text: ' رقم هاتف الفرع 2   ',
              //           ),
              //   ],
              // )
            
            
            
            ],
          )),
    );
  }
}
