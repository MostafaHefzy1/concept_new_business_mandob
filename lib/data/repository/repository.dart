import '../model/allCollectingRepresentative_model.dart';
import '../model/allDeactivateRepresentative_model.dart';
import '../model/me_representative_model.dart';
import '../model/partial_return_model.dart';
import '../model/representative_order_model.dart';
import '../model/user_data_success_model.dart';
import '../web_services/web_services.dart';

class Repository {
  final WebServices webServices;

  Repository(this.webServices);

  //ToDo: LoginWebServices Function
  Future<UserDataSuccessModel> login(
      {required String phone, required String password}) async {
    return UserDataSuccessModel.fromJson(
        await webServices.login(phone: phone, password: password));
  }

  Future<MeRepresentativeModel> meDataRepresentative(
      {required int idRepresentative}) async {
    return MeRepresentativeModel.fromJson(await webServices
        .meDataRepresentative(idRepresentative: idRepresentative));
  }

  Future<AllOrderRepresentativeModel> allOrderRepresentative(
      {required int idRepresentative}) async {
    return AllOrderRepresentativeModel.fromJson(await webServices
        .allOrderRepresentative(idRepresentative: idRepresentative));
  }

  Future<AllDeactivateRepresentativeModel> allDeactivateRepresentative(
      {required int idRepresentative}) async {
    return AllDeactivateRepresentativeModel.fromJson(await webServices
        .allDeactivateRepresentative(idRepresentative: idRepresentative));
  }

  Future<AllCollectingRepresentativeModel> allCollectingRepresentative(
      {required int idRepresentative}) async {
    return AllCollectingRepresentativeModel.fromJson(await webServices
        .allCollectingRepresentative(idRepresentative: idRepresentative));
  }

  Future<dynamic> orderDelivered({required int idProject}) async {
    return await webServices.orderDelivered(idProject: idProject);
  }

  Future<dynamic> orderReturned(
      {required int idProject, required String note}) async {
    return await webServices.orderReturned(idProject: idProject, note: note);
  }

  Future<dynamic> orderPartReturned(
      {required int idProject,
      required List<RetrunPartialModel> note,
      required String representativeRefundPartNote}) async {
    return await webServices.orderPartReturned(
        representativeRefundPartNote: representativeRefundPartNote,
        idProject: idProject,
        note: note);
  }

  Future<dynamic> measurmentOrderRepresentative(
      {required int idProject,
      required String motorMeasurement,
      required String saltMeasurement}) async {
    return await webServices.measurmentOrderRepresentative(
        idProject: idProject,
        motorMeasurement: motorMeasurement,
        saltMeasurement: saltMeasurement);
  }

  Future<dynamic> doneDeactivate({required int idDeactivate}) async {
    return await webServices.doneDeactivate(idDeactivate: idDeactivate);
  }

  Future<dynamic> cancelDeactivate(
      {required int idDeactivate, required String note}) async {
    return await webServices.cancelDeactivate(
        idDeactivate: idDeactivate, note: note);
  }

  Future<dynamic> doneCollecting({required int idCollecting}) async {
    return await webServices.doneCollecting(idCollecting: idCollecting);
  }

  Future<dynamic> cancelCollecting(
      {required int idCollecting,
      required String note,
      required String collectingDelay}) async {
    return await webServices.cancelCollecting(
        idCollecting: idCollecting,
        note: note,
        collectingDelay: collectingDelay);
  }
}
