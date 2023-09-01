// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/repository/repository.dart';
import '../data/model/allCollectingRepresentative_model.dart';
import '../data/model/allDeactivateRepresentative_model.dart';
import '../data/model/me_representative_model.dart';
import '../data/model/partial_return_model.dart';
import '../data/model/representative_order_model.dart';
import 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit(this.repository) : super(LogicInitial());
  final Repository repository;
  static LogicCubit get(context) => BlocProvider.of(context);

  // ToDo Function It is using to show and hide the password
  IconData suffix = Icons.visibility_off;
  bool isShow = true;

  void isShowAndHidePassWord() {
    isShow = !isShow;
    suffix = isShow ? Icons.visibility_off : Icons.remove_red_eye;
    emit(ShowAndHidePassword());
  }

  login({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoadingState());
    await repository
        .login(
      phone: phone,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessState(value));
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  MeRepresentativeModel? meRepresentativeModel;
  meDataRepresentative({required int idRepresentative}) {
    repository
        .meDataRepresentative(idRepresentative: idRepresentative)
        .then((value) {
      meRepresentativeModel = value;
      emit(MeDataRepresentativeSuccessState());
    }).catchError((error) {
      emit(MeDataRepresentativeFailedState());
    });
  }

  AllOrderRepresentativeModel? allOrderRepresentativeModel;
  allOrderRepresentative({required int idRepresentative}) {
    repository
        .allOrderRepresentative(idRepresentative: idRepresentative)
        .then((value) {
      allOrderRepresentativeModel = value;
      emit(RepresentativeOrderSuccess(value));
    }).catchError((error) {
      emit(RepresentativeOrderFailed());
    });
  }

  AllDeactivateRepresentativeModel? allDeactivateRepresentativeModel;
  allDeactivateRepresentative({required int idRepresentative}) {
    repository
        .allDeactivateRepresentative(idRepresentative: idRepresentative)
        .then((value) {
      allDeactivateRepresentativeModel = value;
      emit(AllDeactivateRepresentativeSuccess(value));
    }).catchError((error) {
      emit(AllDeactivateRepresentativeFailed());
    });
  }

  AllCollectingRepresentativeModel? allCollectingRepresentativeModel;
  allCollectingRepresentative({required int idRepresentative}) {
    repository
        .allCollectingRepresentative(idRepresentative: idRepresentative)
        .then((value) {
      allCollectingRepresentativeModel = value;
      emit(AllCollectingRepresentativeSuccess(value));
    }).catchError((error) {
      emit(AllCollectingRepresentativeFailed());
    });
  }

  orderReturned({required int idProject, required String note}) {
    emit(OrderReturnedLoading());
    repository.orderReturned(idProject: idProject, note: note).then((value) {
      emit(OrderReturnedSuccess());
    }).catchError((error) {
      emit(OrderReturnedFailed());
    });
  }

  orderPartReturned(
      {required int idProject,
      required List<RetrunPartialModel> note,
      required String representativeRefundPartNote}) {
    emit(OrderPartReturnedLoading());
    repository
        .orderPartReturned(
            idProject: idProject,
            note: note,
            representativeRefundPartNote: representativeRefundPartNote)
        .then((value) {
      emit(OrderPartReturnedSuccess());
    }).catchError((error) {
      emit(OrderPartReturnedFailed());
    });
  }

  orderDelivered({required int idProject}) {
    emit(OrderDeliveredLoading());
    repository.orderDelivered(idProject: idProject).then((value) {
      emit(OrderDeliveredSuccess());
    }).catchError((error) {
      emit(OrderDeliveredFailed());
    });
  }

  bool measurmentOrder = false;
  changeMeasurmentOrder(bool value) {
    measurmentOrder = value;
    emit(BoolValueMeasurmentOrder());
  }

  measurmentOrderRepresentative(
      {required int idProject,
      required String motorMeasurement,
      required String saltMeasurement}) {
    emit(MeasurmentOrderRepresentativeLoading());
    repository
        .measurmentOrderRepresentative(
            idProject: idProject,
            motorMeasurement: motorMeasurement,
            saltMeasurement: saltMeasurement)
        .then((value) {
      emit(MeasurmentOrderRepresentativeSuccess());
    }).catchError((error) {
      emit(MeasurmentOrderRepresentativeFailed());
    });
  }

  doneCollecting({required int idCollecting}) {
    emit(DoneCollectingLoading());
    repository.doneCollecting(idCollecting: idCollecting).then((value) {
      emit(DoneCollectingSuccess());
    }).catchError((error) {
      emit(DoneCollectingFailed());
    });
  }

  cancelCollecting(
      {required int idCollecting,
      required String note,
      required String collectingDelay}) {
    emit(CancelCollectingLoading());
    repository
        .cancelCollecting(
            idCollecting: idCollecting,
            note: note,
            collectingDelay: collectingDelay)
        .then((value) {
      emit(CancelCollectingSuccess());
    }).catchError((error) {
      emit(CancelCollectingFailed());
    });
  }

  Future<void> goToMaps(
      {required String latitude, required String longitude}) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${double.parse(latitude)},${double.parse(longitude)}';
    final String emcodeUrl = Uri.encodeFull(googleUrl);
    log(emcodeUrl);
    if (await canLaunch(emcodeUrl)) {
      await launch(emcodeUrl);
      emit(GoToMapSuccessState());
    } else {
      emit(GoToMapFailedState());
    }
  }

  doneDeactivate({required int idDeactivate}) {
    emit(DoneDeactivateLoading());
    repository.doneDeactivate(idDeactivate: idDeactivate).then((value) {
      emit(DoneDeactivateSuccess());
    }).catchError((error) {
      emit(DoneDeactivateFailed());
    });
  }

  cancelDeactivate({required int idDeactivate, required String note}) {
    emit(CancelDeactivateLoading());
    repository
        .cancelDeactivate(idDeactivate: idDeactivate, note: note)
        .then((value) {
      emit(CancelDeactivateSuccess());
    }).catchError((error) {
      emit(CancelDeactivateFailed());
    });
  }




  List<String> listPartialRetrun = [
    "اختار سبب",
    "لا يوجد ما يكفى من النقدية",
    "تاريخ الصلاحيه غير مناسب",
    "المنتج مختلف عن الوصف",
    "تم طلب المنتجات بالخطأ من العميل",
    "اخري"
  ];

  String initalorderReturnedPartial = "اختار سبب";

  List<String> listorderReturned = [
    "اختار سبب",
    "المكان مغلق",
    "الاوردر وهمى",
    "لا يوجد ما يكفى من النقدية",
    "تاريخ الصلاحيه غير مناسب",
    "المنتج مختلف عن الوصف",
    "تم طلب المنتجات بالخطأ من العميل",
    "اخري"
  ];

  String initialorderReturned = "اختار سبب";




  List<String> listcancelDeactivate = [
    "اختار سبب",
    "المكان مغلق",
    "الاوردر وهمى",
    "لا يوجد ما يكفى من النقدية",
    "تاريخ الصلاحيه غير مناسب",
    "المنتج مختلف عن الوصف",
    "تم طلب المنتجات بالخطأ من العميل",
    "اخري"
  ];

  String initialcancelDeactivate = "اختار سبب";





  List<String> listcancelCollecting = [
    "اختار سبب",
    "المكان مغلق",
    "الاوردر وهمى",
    "لا يوجد ما يكفى من النقدية",
    "تاريخ الصلاحيه غير مناسب",
    "المنتج مختلف عن الوصف",
    "تم طلب المنتجات بالخطأ من العميل",
    "اخري"
  ];

  String initialcancelCollecting = "اختار سبب";


}
