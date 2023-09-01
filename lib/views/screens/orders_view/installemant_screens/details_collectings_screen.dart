// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mandobaswaaq/views/screens/orders_view/installemant_screens/widget/collectings_details_item.dart';
import '../../../../data/model/representative_order_model.dart';
import '../../../../logic/logic_cubit.dart';
import '../../../../logic/logic_state.dart';
import '../../../../utils/helpers.dart';
import '../../../../utils/style.dart';
import '../../../shared_widgets/delay_colleting_widget.dart';
import '../../../shared_widgets/show_loading_indicator_f.unction.dart';
import '../orders_representative_screen.dart';

class DetailsCollectingsScreen extends StatelessWidget {
  final List<OrderItems> orderItem;
  final int idOrder;
  final String delayDate;
  DetailsCollectingsScreen(
      {Key? key,
      required this.orderItem,
      required this.idOrder,
      required this.delayDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {
        if (state is DoneCollectingLoading) {
          showLoadingIndicator(context);
        }

        if (state is DoneCollectingSuccess) {
          Get.back();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
          LogicCubit.get(context).initialorderReturned == "اختار سبب";
          MyHelpers.showSnackBar("تم تاكيد التحصيل بنجاح", "alaram");
        }
        if (state is DoneCollectingFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا تاكيد التحصيل", "error");
        }

        if (state is CancelCollectingLoading) {
          showLoadingIndicator(context);
        }

        if (state is CancelCollectingSuccess) {
          Get.back();

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) => const OrdersRepresentativeScreen()),
              (route) => false);
          MyHelpers.showSnackBar("تم تاجيل التحصيل بنجاح", "alaram");
        }
        if (state is CancelCollectingFailed) {
          Get.back();
          MyHelpers.showSnackBar("حدث خطا اثناء تاجيل التحصيل", "error");
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
              'تفاصيل التحصيل',
              style: TextStyle(
                color: MyColors.blackColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CollectingsDetailsItem(
                  orderItems: orderItem,
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
                            AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.noHeader,
                                body: CancelCollectingWidget(
                                  dateDelay: delayDate,
                                  projectId: idOrder,
                                )).show();
                          },
                          child: Text(
                            'تاجيل التحصيل',
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
                            MyHelpers.confrimAwesomeDialog(
                                context: context,
                                btnOkText: "تاكيد",
                                btnCancelText: "الغاء",
                                btnOkOnPress: () {
                                  cubit.doneCollecting(idCollecting: idOrder);
                                });
                          },
                          child: Text(
                            'تاكيد التحصيل',
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
        );
      },
    );
  }
}
