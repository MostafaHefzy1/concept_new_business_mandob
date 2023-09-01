import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandobaswaaq/views/screens/orders_view/deactivate_screens/widget/deactive_Screen_item.dart';
import '../../../../data/model/allDeactivateRepresentative_model.dart';
import '../../../../logic/logic_cubit.dart';
import '../../../../logic/logic_state.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../shared_widgets/LoadingIndicator.dart';

class DeactivateScreen extends StatefulWidget {
  const DeactivateScreen({super.key});

  @override
  State<DeactivateScreen> createState() => _DeactivateScreenState();
}

class _DeactivateScreenState extends State<DeactivateScreen> {
  @override
  void initState() {
    LogicCubit.get(context).allDeactivateRepresentative(
        idRepresentative: CashHelper.getData(key: "idRepresentative"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LogicCubit.get(context);

        return Scaffold(
            body: cubit.allDeactivateRepresentativeModel == null
                ? const Center(child: LoadingIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (cubit.allDeactivateRepresentativeModel!.data!.isEmpty)
                            ? SizedBox(height: 30.h)
                            : SizedBox(height: 1.h),
                        (cubit.allDeactivateRepresentativeModel!.data!.isEmpty
                            ? Center(
                                child: Text(
                                  'لا يوجد لديك اى اعطال حاليا',
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
                                itemCount: cubit
                                    .allDeactivateRepresentativeModel!
                                    .data!
                                    .length,
                                itemBuilder: (context, index) {
                                  return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: DeactiveItem(
                                        deactivateRepresentative:
                                            cubit.allDeactivateRepresentativeModel!
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
