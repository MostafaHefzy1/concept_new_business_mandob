import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandobaswaaq/utils/style.dart';
import 'package:mandobaswaaq/views/screens/orders_view/order_screens/widget/order_Screen_item.dart';

import '../../../../data/model/representative_order_model.dart';
import '../../../../logic/logic_cubit.dart';
import '../../../../logic/logic_state.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../shared_widgets/LoadingIndicator.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    LogicCubit.get(context).allOrderRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit  = LogicCubit.get(context);
        return Scaffold(
            body: cubit.allOrderRepresentativeModel == null
                ? const Center(child: LoadingIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (cubit.allOrderRepresentativeModel!.data!.isEmpty)
                            ? SizedBox(height: 30.h)
                            : SizedBox(height: 1.h),
                      
                        (cubit.allOrderRepresentativeModel!.data!.isEmpty
                            ? Center(
                                child: Text(
                                  'لا يوجد لديك اى طلبات حاليا',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(top: 4.h),
                                itemCount:
                                    cubit.allOrderRepresentativeModel!.data!.length,
                                itemBuilder: (context, index) {
                                  return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: OrderItem(
                                        orderRepresentative:
                                            cubit.allOrderRepresentativeModel!
                                                .data![index],
                                        index: index,
                                      ));
                                },
                              ))
                      ],
                    ),
                  ));
      },
    );
  }
}
