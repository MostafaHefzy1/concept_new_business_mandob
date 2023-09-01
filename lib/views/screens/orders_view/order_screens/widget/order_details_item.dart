import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/model/representative_order_model.dart';
import '../../../../../utils/style.dart';

class OrderDetailsItem extends StatelessWidget {
  final List<OrderItems> orderItems;

  const OrderDetailsItem({super.key, required this.orderItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DataTable2(
              columnSpacing: 25,
              horizontalMargin: 12,
              minWidth: 500.w,
              border: TableBorder.all(color: MyColors.lightGrey, width: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                  label: Center(child: Text("العدد")),
                ),
                DataColumn(
                  label: Center(child: Text("السعر")),
                ),
                DataColumn(
                  label: Center(child: Text("الضمان")),
                ),
                DataColumn(
                  label: Center(child: Text("الاجمالي")),
                ),
              ],
              rows: List<DataRow>.generate(
                  orderItems.length,
                  (index) => DataRow(cells: [
                        DataCell(Center(child: Text("${index + 1}"))),
                        DataCell(Center(
                          child: Text(
                            "${orderItems[index].product!.nameAr}",
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            "${orderItems[index].price}",
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            "${orderItems[index].quantity}",
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                            "${orderItems[index].product!.guarantee}شهر",
                          ),
                        )),
                        DataCell(
                          Center(
                              child: Text(
                            "${orderItems[index].totalPrice}",
                          )),
                        )
                      ]))),
        ),
      ),
    );
  }
}
