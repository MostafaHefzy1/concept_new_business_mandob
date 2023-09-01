// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandobaswaaq/views/screens/orders_view/order_screens/widget/order_details_item.dart';
import '../../../../data/model/partial_return_model.dart';
import '../../../../data/model/representative_order_model.dart';
import '../../../../logic/logic_cubit.dart';
import '../../../../logic/logic_state.dart';
import '../../../../utils/helpers.dart';
import '../../../../utils/style.dart';
import '../../../shared_widgets/all_return_widget.dart';
import '../../../shared_widgets/partial_retrun_widget.dart';
import '../../../shared_widgets/show_loading_indicator_f.unction.dart';
import '../../../shared_widgets/traditional_text_form_field.dart';
import '../orders_representative_screen.dart';

class DetailsOrderScreen extends StatefulWidget {
  final List<OrderItems> orderItem;
  final bool isMaintenance;
  final int idOrder;

  DetailsOrderScreen({
    Key? key,
    required this.orderItem,
    required this.isMaintenance,
    required this.idOrder,
  }) : super(key: key);

  @override
  State<DetailsOrderScreen> createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController saltMeasurementController =
      TextEditingController();

  final TextEditingController motorMeasurementController =
      TextEditingController();
  List<RetrunPartialModel> retrunPartialModel = [];

  int allQuntityInReturnOrderPartial = 0;

  int allQuntity = 0;

  @override
  void initState() {
    LogicCubit.get(context).changeMeasurmentOrder(false);
    super.initState();
  }

  Widget build(BuildContext context) {
    retrunPartialModel = List.generate(
        widget.orderItem.length,
        (index) => RetrunPartialModel(
            quntity: widget.orderItem[index].quantity!,
            productId: widget.orderItem[index].id!));
    for (int i = 0; i < widget.orderItem.length; i++) {
      allQuntity += widget.orderItem[i].quantity!;
    }
    allQuntityInReturnOrderPartial = 0;
    for (int i = 0; i < retrunPartialModel.length; i++) {
      allQuntityInReturnOrderPartial += retrunPartialModel[i].quntity;
    }
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {
        if (state is MeasurmentOrderRepresentativeSuccess) {
          LogicCubit.get(context).changeMeasurmentOrder(true);
        }

        if (state is MeasurmentOrderRepresentativeLoading) {
          showLoadingIndicator(context);
        }

        if (state is MeasurmentOrderRepresentativeSuccess) {
          Get.back();
          MyHelpers.showSnackBar("تم تسجيل قياسات الفلتر بنجاح", "alaram");
        }

        if (state is MeasurmentOrderRepresentativeFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا تسجيل قياسات الفلتر", "error");
        }

        if (state is OrderDeliveredLoading) {
          showLoadingIndicator(context);
        }

        if (state is OrderDeliveredSuccess) {
          Get.back();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);

          MyHelpers.showSnackBar("تم توصيل الاوردر بنجاح", "alaram");
        }

        if (state is OrderDeliveredFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا اثناء تسليم الاوردر", "error");
        }

        if (state is OrderReturnedLoading) {
          showLoadingIndicator(context);
        }

        if (state is OrderReturnedSuccess) {
          Get.back();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
          LogicCubit.get(context).initialorderReturned == "اختار سبب";
          MyHelpers.showSnackBar("تم استرجاع الاوردر بنجاح", "alaram");
        }

        if (state is OrderReturnedFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا اثناء استرجاع الاوردر", "error");
        }

        if (state is OrderPartReturnedLoading) {
          showLoadingIndicator(context);
        }

        if (state is OrderPartReturnedSuccess) {
          Get.back();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
          LogicCubit.get(context).initalorderReturnedPartial == "اختار سبب";
          MyHelpers.showSnackBar("تم استرجاع جزئي الاوردر بنجاح", "alaram");
        }

        if (state is OrderPartReturnedFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا اثناء استرجاع جزئي الاوردر", "error");
        }
      },
      builder: (context, state) {
        var cubit = LogicCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(
              color: MyColors.primaryColor,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: MyColors.whiteColor,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              'تفاصيل الطلب',
              style: TextStyle(
                color: MyColors.blackColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: [
              widget.isMaintenance
                  ? TextButton(
                      onPressed: () {
                        AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.noHeader,
                            body: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    const Text(
                                      "اكتب القياسات",
                                      style: TextStyle(
                                          color: MyColors.primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SingleChildScrollView(
                                      child: Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            TraditionalTextFormField(
                                              hintText: 'قياس الموتور',
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'هذا الحقل مطلوب';
                                                }
                                              },
                                              textInputType:
                                                  TextInputType.number,
                                              controller:
                                                  motorMeasurementController,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TraditionalTextFormField(
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'هذا الحقل مطلوب';
                                                }
                                              },
                                              hintText: 'نسبه الملح ف الفلتر',
                                              textInputType:
                                                  TextInputType.number,
                                              controller:
                                                  saltMeasurementController,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: Colors.green,
                                            child: TextButton(
                                              child: Text(
                                                "تاكيد",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                              onPressed: () async {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  await cubit
                                                      .measurmentOrderRepresentative(
                                                    idProject: widget.idOrder,
                                                    motorMeasurement:
                                                        motorMeasurementController
                                                            .text,
                                                    saltMeasurement:
                                                        saltMeasurementController
                                                            .text,
                                                  );

                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 3.w),
                                        Expanded(
                                          child: Container(
                                            color: MyColors.redColor,
                                            child: TextButton(
                                              child: Text(
                                                "الغاء",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            )).show();
                      },
                      child: const Text(
                        "قياسات الفلتر",
                        style: TextStyle(
                            fontSize: 16,
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ))
                  : SizedBox()
            ],
          ),
          body: Column(
            children: [
              // ListView.separated(
              //     padding: EdgeInsets.only(top: 10.h),
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) => Directionality(
              //         textDirection: TextDirection.rtl,
              //         child:
              //     separatorBuilder: (context, index) => SizedBox(
              //           height: 1.h,
              //         ),
              //     itemCount: widget.orderItem.length),
              OrderDetailsItem(
                orderItems: widget.orderItem,
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
                          if (widget.isMaintenance) {
                            if (cubit.measurmentOrder == false) {
                              MyHelpers.showSnackBar(
                                  "برجاء ادخال قياسات الفلتر", "error");
                            } else {
                              AwesomeDialog(
                                  context: context,
                                  animType: AnimType.scale,
                                  dialogType: DialogType.noHeader,
                                  body: AllRetrunWidget(
                                    projectId: widget.idOrder,
                                  )).show();
                            }
                          } else {
                            AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.noHeader,
                                body: AllRetrunWidget(
                                  projectId: widget.idOrder,
                                )).show();
                          }
                        },
                        child: Text(
                          'ارجاع الطلب',
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
                          if (widget.isMaintenance) {
                            if (cubit.measurmentOrder == false) {
                              MyHelpers.showSnackBar(
                                  "برجاء ادخال قياسات الفلتر", "error");
                            } else {
                              MyHelpers.confrimAwesomeDialog(
                                  context: context,
                                  btnOkText: "تاكيد",
                                  btnCancelText: "الغاء",
                                  btnOkOnPress: () {
                                    cubit.orderDelivered(
                                        idProject: widget.idOrder);
                                  });
                            }
                          } else {
                            MyHelpers.confrimAwesomeDialog(
                                context: context,
                                btnOkText: "تاكيد",
                                btnCancelText: "الغاء",
                                btnOkOnPress: () {
                                  cubit.orderDelivered(
                                      idProject: widget.idOrder);
                                });
                          }
                        },
                        child: Text(
                          'تسليم الطلب',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: MaterialButton(
                  onPressed: () {
                    if (widget.isMaintenance) {
                      if (cubit.measurmentOrder == false) {
                        MyHelpers.showSnackBar(
                            "برجاء ادخال قياسات الفلتر", "error");
                      } else {
                        AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.noHeader,
                            body: Column(
                              children: [
                                Card(
                                    elevation: 5,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 2.w),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.whiteColor,
                                              border: Border.all(
                                                color: MyColors.primaryColor,
                                              )),
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                color: MyColors.primaryColor,
                                              )),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "ارجاع جزئي",
                                          style: TextStyle(
                                              color: MyColors.blackColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )),
                                ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: buildWidgetReturnPartial(
                                                index: index)),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                    itemCount: widget.orderItem.length),
                                SizedBox(
                                  height: 10.h,
                                ),
                                MaterialButton(
                                  minWidth: double.infinity,
                                  color: MyColors.primaryColor,
                                  onPressed: () {
                                    log(allQuntity.toString());
                                    log(allQuntityInReturnOrderPartial
                                        .toString());
                                    if (allQuntity ==
                                        allQuntityInReturnOrderPartial) {
                                      MyHelpers.showSnackBar(
                                          "اصبح الاوردر مرتجع كلي", "error");
                                    } else if (allQuntity -
                                                allQuntityInReturnOrderPartial ==
                                            allQuntity &&
                                        widget.orderItem.length ==
                                            retrunPartialModel.length) {
                                      MyHelpers.showSnackBar(
                                          "اصبح الاوردر استلم كلي", "error");
                                    } else {
                                      AwesomeDialog(
                                              context: context,
                                              animType: AnimType.scale,
                                              dialogType: DialogType.noHeader,
                                              body: PartialRetrunWidget(
                                                  projectId: widget.idOrder,
                                                  notePartialRetrun:
                                                      retrunPartialModel))
                                          .show();
                                    }
                                  },
                                  child: Text(
                                    'ارسال',
                                    style: TextStyle(
                                      color: MyColors.whiteColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            )).show();
                      }
                    } else {
                      AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.noHeader,
                          body: Column(
                            children: [
                              Card(
                                  elevation: 5,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 2.w),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: MyColors.whiteColor,
                                            border: Border.all(
                                              color: MyColors.primaryColor,
                                            )),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: MyColors.primaryColor,
                                            )),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "ارجاع جزئي",
                                        style: TextStyle(
                                            color: MyColors.blackColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  )),
                              ListView.separated(
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: buildWidgetReturnPartial(
                                              index: index)),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                  itemCount: widget.orderItem.length),
                              SizedBox(
                                height: 10.h,
                              ),
                              MaterialButton(
                                minWidth: double.infinity,
                                color: MyColors.primaryColor,
                                onPressed: () {
                                  log(allQuntity.toString());
                                  log(allQuntityInReturnOrderPartial
                                      .toString());
                                  if (allQuntity ==
                                      allQuntityInReturnOrderPartial) {
                                    MyHelpers.showSnackBar(
                                        "اصبح الاوردر مرتجع كلي", "error");
                                  } else if (allQuntity -
                                              allQuntityInReturnOrderPartial ==
                                          allQuntity &&
                                      widget.orderItem.length ==
                                          retrunPartialModel.length) {
                                    MyHelpers.showSnackBar(
                                        "اصبح الاوردر استلم كلي", "error");
                                  } else {
                                    AwesomeDialog(
                                            context: context,
                                            animType: AnimType.scale,
                                            dialogType: DialogType.noHeader,
                                            body: PartialRetrunWidget(
                                                projectId: widget.idOrder,
                                                notePartialRetrun:
                                                    retrunPartialModel))
                                        .show();
                                  }
                                },
                                child: Text(
                                  'ارسال',
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          )).show();
                    }
                  },
                  child: Text(
                    'ارجاع جزئي',
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
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildWidgetReturnPartial({required int index}) {
    int quntity = retrunPartialModel[index].quntity;
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "اسم المنتج : ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              (widget.orderItem[index].product!.nameAr)
                                  .toString(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('كميه المنتج المرتجعه : ',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Row(
                                children: [
                                  quntity == widget.orderItem[index].quantity
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                12.0,
                                              ),
                                              color: MyColors.greyColor),
                                          child: const Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              quntity = quntity + 1;
                                              retrunPartialModel[index] =
                                                  (RetrunPartialModel(
                                                      quntity: quntity,
                                                      productId: widget
                                                          .orderItem[index]
                                                          .id!));
                                              allQuntityInReturnOrderPartial =
                                                  0;

                                              for (int i = 0;
                                                  i < retrunPartialModel.length;
                                                  i++) {
                                                allQuntityInReturnOrderPartial +=
                                                    retrunPartialModel[i]
                                                        .quntity;
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12.0,
                                                ),
                                                color: MyColors.primaryColor),
                                            child: const Icon(
                                              Icons.add,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    width: 50.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        color: Colors.blueGrey[500]),
                                    child: Center(
                                      child: Text(
                                        (quntity).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  quntity == 0
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                12.0,
                                              ),
                                              color: MyColors.greyColor),
                                          child: const Icon(
                                            Icons.remove,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              quntity = quntity - 1;
                                              retrunPartialModel[index] =
                                                  (RetrunPartialModel(
                                                      quntity: quntity,
                                                      productId: widget
                                                          .orderItem[index]
                                                          .id!));
                                              allQuntityInReturnOrderPartial =
                                                  0;
                                              for (int i = 0;
                                                  i < retrunPartialModel.length;
                                                  i++) {
                                                allQuntityInReturnOrderPartial +=
                                                    retrunPartialModel[i]
                                                        .quntity;
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12.0,
                                                ),
                                                color: MyColors.primaryColor),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          );
                        }),
                        SizedBox(height: 10.h),
                      ])),
            ],
          ),
        );
      },
    );
  }
}
