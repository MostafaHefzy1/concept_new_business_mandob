import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandobaswaaq/views/screens/orders_view/installemant_screens/widget/collectings_Screen_item.dart';
import '../../../../data/model/allCollectingRepresentative_model.dart';
import '../../../../logic/logic_cubit.dart';
import '../../../../logic/logic_state.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../shared_widgets/LoadingIndicator.dart';

class InstallemantScreen extends StatefulWidget {
  const InstallemantScreen({super.key});

  @override
  State<InstallemantScreen> createState() => _InstallemantScreenState();
}

class _InstallemantScreenState extends State<InstallemantScreen> {
  @override
  void initState() {
    LogicCubit.get(context).allCollectingRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {
     
      },
      builder: (context, state) {
                var cubit  = LogicCubit.get(context);

        return Scaffold(
            body: cubit.allCollectingRepresentativeModel == null
                ? const Center(child: LoadingIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (cubit.allCollectingRepresentativeModel!.collectingRepresentative!.isEmpty)
                            ? SizedBox(height: 30.h)
                            : SizedBox(height: 1.h),
                        (cubit.allCollectingRepresentativeModel!.collectingRepresentative!.isEmpty
                            ? Center(
                                child: Text(
                                  'لا يوجد لديك اى تحصيلات حاليا',
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
                                itemCount: cubit.allCollectingRepresentativeModel!
                                    .collectingRepresentative!.length,
                                itemBuilder: (context, index) {
                                  return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: InstallemantItem(
                                        collectingRepresentative:
                                            cubit.allCollectingRepresentativeModel!
                                                .collectingRepresentative![index],
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
