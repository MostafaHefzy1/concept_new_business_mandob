import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/model/allDeactivateRepresentative_model.dart';
import '../../../../../utils/style.dart';

class DeactiveDetailsItem extends StatelessWidget {
  final DeactivateRepresentative deactivatesItem;

  const DeactiveDetailsItem({super.key, required this.deactivatesItem});
  @override
  Widget build(BuildContext context) {
    // return Container(
    //     margin: EdgeInsets.symmetric(
    //       horizontal: 20.w,
    //       vertical: 2.h,
    //     ),
    //     padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    //     decoration: BoxDecoration(
    //       color: MyColors.whiteColor,
    //       borderRadius: BorderRadius.all(Radius.circular(15.r)),
    //       border: Border.all(
    //         color: MyColors.greyColor,
    //       ),
    //     ),
    //     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         // ignore: prefer_const_literals_to_create_immutables
    //         children: [
    //           const Text(
    //             "اسم المنتج : ",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           Text(
    //             "${deactivatesItem.product!.nameAr}",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold, color: MyColors.primaryColor),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 10.h,
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           const Text('سعر المنتج : ',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(fontWeight: FontWeight.bold)),
    //           Text(
    //             "${deactivatesItem.product!.sectionalPrice}",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold, color: MyColors.primaryColor),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: 10.h,
    //       ),

    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           const Text(
    //             'الضمان : ',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Text(
    //             "${deactivatesItem.product!.guarantee} شهر",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold, color: MyColors.primaryColor),
    //           ),
    //         ],
    //       ),
    //     ]));
    return SizedBox(
      height: 180.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DataTable2(
              columnSpacing: 25,
              horizontalMargin: 12,
              minWidth: 250.w,
              border: TableBorder.all(color: MyColors.primaryColor, width: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              headingTextStyle: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold),
              dataTextStyle: TextStyle(
                  color: MyColors.blackColor,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold),
              empty: Text("لا يوجد طلبات",
                  style: TextStyle(
                      color: MyColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold)),
              columns: const [
                DataColumn2(
                  label: Center(
                    child: Text("م"),
                  ),
                ),
                DataColumn2(
                  label: Center(child: Text("اسم المنتج")),
                ),
                DataColumn(
                  label: Center(child: Text("السعر")),
                ),
                DataColumn(
                  label: Center(child: Text("الضمان")),
                ),
              ],
              rows: List<DataRow>.generate(
                  1,
                  (index) => DataRow(cells: [
                        DataCell(Center(child: Text("${index + 1}"))),
                        DataCell(Center(
                          child: Text(
                            "${deactivatesItem.product!.nameAr}",
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            "${deactivatesItem.product!.sectionalPrice}",
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            "${deactivatesItem.product!.guarantee} شهر",
                          ),
                        )),
                      ]))),
        ),
      ),
    );
  }
}
