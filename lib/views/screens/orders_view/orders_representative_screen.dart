import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandobaswaaq/logic/logic_cubit.dart';
import 'package:mandobaswaaq/utils/style.dart';

import 'package:flutter/material.dart';
import 'package:mandobaswaaq/views/shared_widgets/LoadingIndicator.dart';

import '../../../logic/logic_state.dart';
import '../../../utils/shared_preferences.dart';
import '../../shared_widgets/floation_action_button.dart';
import '../login_screen.dart';
import 'deactivate_screens/deactivate_screen.dart';
import 'installemant_screens/collectings_screen.dart';
import 'order_screens/order_screen.dart';

class OrdersRepresentativeScreen extends StatefulWidget {
  const OrdersRepresentativeScreen({Key? key}) : super(key: key);

  @override
  State<OrdersRepresentativeScreen> createState() =>
      _OrdersRepresentativeScreenState();
}

class _OrdersRepresentativeScreenState
    extends State<OrdersRepresentativeScreen> {
  @override
  void initState() {
    LogicCubit.get(context).allOrderRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));
    LogicCubit.get(context).allDeactivateRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));
    LogicCubit.get(context).allCollectingRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));
    LogicCubit.get(context).meDataRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LogicCubit.get(context);
        return cubit.allOrderRepresentativeModel != null &&
                cubit.allDeactivateRepresentativeModel != null &&
                cubit.allCollectingRepresentativeModel != null &&
                cubit.meRepresentativeModel != null
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Scaffold(
                        floatingActionButton: FloatingActionButtonWidget(
                          storeName: cubit.meRepresentativeModel!.data!
                              .employees![0].store!.nameAr!,
                          storeNumber1: cubit.meRepresentativeModel!.data!
                              .employees![0].store!.firstPhone!,
                          storeNumber2: cubit.meRepresentativeModel!.data!
                                      .employees![0].store!.secondPhone ==
                                  null
                              ? ""
                              : cubit.meRepresentativeModel!.data!.employees![0]
                                  .store!.secondPhone!,
                        ),
                        appBar: AppBar(
                            backgroundColor: MyColors.whiteColor,
                            centerTitle: true,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "  خط السير ",
                                  style: TextStyle(
                                      color: MyColors.primaryColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                cubit
                                                .allCollectingRepresentativeModel!
                                                .collectingRepresentative!
                                                .length +
                                            cubit
                                                .allDeactivateRepresentativeModel!
                                                .data!
                                                .length +
                                            cubit.allOrderRepresentativeModel!
                                                .data!.length ==
                                        0
                                    ? SizedBox()
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundColor: MyColors.whiteColor,
                                        child: Text(
                                          '${cubit.allCollectingRepresentativeModel!.collectingRepresentative!.length + cubit.allDeactivateRepresentativeModel!.data!.length + cubit.allOrderRepresentativeModel!.data!.length}موعد ',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.redColor),
                                        ),
                                      ),
                              ],
                            ),
                            elevation: 0.0,
                            actions: [
                              TextButton(
                                onPressed: () {
                                  CashHelper.removeData(
                                      key: "idRepresentative");
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const LoginScreen()),
                                      (route) => false);
                                },
                                child: Text(
                                  "تسجيل الخروج",
                                  style: TextStyle(
                                    color: MyColors.greyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              )
                            ],
                            bottom: TabBar(
                              indicatorColor: MyColors.primaryColor,
                              tabs: [
                                Tab(
                                  child: Row(
                                    children: [
                                      Text(
                                        "الطلبات",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: MyColors.primaryColor,
                                        ),
                                      ),
                                      cubit.allOrderRepresentativeModel!.data!
                                              .isEmpty
                                          ? SizedBox()
                                          : CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  MyColors.whiteColor,
                                              child: Text(
                                                '${cubit.allOrderRepresentativeModel!.data!.length}',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.redColor),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    children: [
                                      Text(
                                        "الاعطال",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: MyColors.primaryColor,
                                        ),
                                      ),
                                      cubit.allDeactivateRepresentativeModel!
                                              .data!.isEmpty
                                          ? SizedBox()
                                          : CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  MyColors.whiteColor,
                                              child: Text(
                                                '${cubit.allDeactivateRepresentativeModel!.data!.length}',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.redColor),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    children: [
                                      Text(
                                        "التحصيلات",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: MyColors.primaryColor,
                                        ),
                                      ),
                                      cubit.allCollectingRepresentativeModel!
                                              .collectingRepresentative!.isEmpty
                                          ? SizedBox()
                                          : CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  MyColors.whiteColor,
                                              child: Text(
                                                '${cubit.allCollectingRepresentativeModel!.collectingRepresentative!.length}',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.redColor),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        body: const TabBarView(children: <Widget>[
                          OrderScreen(),
                          DeactivateScreen(),
                          InstallemantScreen(),
                        ]))),
              )
            : const Scaffold(body: Center(child: LoadingIndicator()));
      },
    );
  }
}
