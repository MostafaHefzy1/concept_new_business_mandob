import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/model/representative_order_model.dart';
import '../../../../../logic/logic_cubit.dart';
import '../../../../../utils/style.dart';
import '../details_order_screen.dart';

class OrderItem extends StatelessWidget {
  final OrderRepresentative orderRepresentative;
  final int index;

  const OrderItem(
      {super.key, required this.orderRepresentative, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsOrderScreen(
                      idOrder: orderRepresentative.id!,
                      isMaintenance:
                          orderRepresentative.orderType == "installation"
                              ? false
                              : true,
                      orderItem: orderRepresentative.orderItems!,
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
                            "${orderRepresentative.id}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                          const Text('نوع الطلب : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "${orderRepresentative.orderType == "installation" ? "تركيب" : "صيانه"}",
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
                            "${orderRepresentative.user!.name}",
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
                            "${orderRepresentative.user!.address}",
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
                            'طريقه الدفع : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ("${orderRepresentative.paidType == "cach" ? "الدفع عند الاستلام" : "الدفع لإلكتروني"}"),
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
                            'السعر : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ("${orderRepresentative.subTotal}"),
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
                            'الشحن : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ("${orderRepresentative.shippingPrice}"),
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
                      orderRepresentative.tax == 0
                          ? SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'قيمه الضريبه : ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ("${orderRepresentative.tax}"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primaryColor),
                                ),
                              ],
                            ),
                      orderRepresentative.tax == 0
                          ? SizedBox()
                          : SizedBox(
                              height: 10.h,
                            ),
                      orderRepresentative.discount == 0
                          ? SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'قيمه الخصم : ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ("${orderRepresentative.discount}"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primaryColor),
                                ),
                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'السعر الاجمالي : ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ("${orderRepresentative.paid}"),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: MaterialButton(
                  onPressed: () {
                    LogicCubit.get(context).goToMaps(
                      latitude:
                          "${orderRepresentative.user!.goeLocation!.split(",").first}",
                      longitude:
                          "${orderRepresentative.user!.goeLocation!.split(",").last}",
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
