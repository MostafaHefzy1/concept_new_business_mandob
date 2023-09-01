
import 'package:dio/dio.dart';
import '../model/partial_return_model.dart';
import 'endpoint.dart';
import '../../utils/constants.dart';

class WebServices {
  Dio? dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstats.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 100 * 1000, //30 Seconds
      receiveTimeout: 100 * 1000, //30 Seconds
      headers: {
        'Content-Type': 'application/json',
        "lang": "ar",
        "Accept": "application/json"
      },
    );
    dio = Dio(options);
    dio!.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      request: true,
    ));
  }

  //ToDo: LoginWebServices Function
  Future<dynamic> login({
    required String phone,
    required String password,
  }) async {
    try {
      var response = await dio!.post(loginEndPoint, data: {
        "phone": phone,
        "password": password,
      });

      return response.data;
    } on DioError catch (error) {
      if (error.response != null) {}
    }
  }


  Future<dynamic> meDataRepresentative({required int idRepresentative}) async {
    try {
      var response =
          await dio!.get("$meRepresentativeEndPoint/$idRepresentative");
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }






  Future<dynamic> allOrderRepresentative({required int idRepresentative}) async {
    try {
      var response =
          await dio!.get("$allOrderRepresentativeEndPoint/$idRepresentative");
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }




    Future<dynamic> allDeactivateRepresentative({required int idRepresentative}) async {
    try {
      var response =
          await dio!.get("$allDeactivateRepresentativeEndPoint/$idRepresentative");
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }



    Future<dynamic> allCollectingRepresentative({required int idRepresentative}) async {
    try {
      var response =
          await dio!.get("$allCollectingRepresentativeEndPoint/$idRepresentative");
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }


  Future<dynamic> orderDelivered({required int idProject}) async {
    try {
      Response response = await dio!
          .post(orderDeliveredEndPoint, data: {"order_id": idProject});
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> orderReturned(
      {required int idProject, required String note}) async {
    try {
      Response response = await dio!.post(orderReturnedEndPoint,
          data: {"order_id": idProject, "notes": note});
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> orderPartReturned(
      {required int idProject,
      required List<RetrunPartialModel> note,
      required String representativeRefundPartNote}) async {
    try {
      List arrayList = [];
      Map obj = {};
      for (int i = 0; i < note.length; i++) {
        obj['returned_quantity'] = note[i].quntity;
        obj['product_id'] = note[i].productId;
        if (note[i].quntity != 0) arrayList.add(obj);
        obj = {};
      }

      Response response = await dio!.post(orderPartReturnedEndPoint, data: {
        "order_id": idProject,
        "returned_items": arrayList,
        "returned_reason": representativeRefundPartNote
      });
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> measurmentOrderRepresentative(
      {required int idProject,
      required String motorMeasurement,
      required String saltMeasurement}) async {
    try {
      Response response = await dio!.post(measurmentOrderRepresentativeEndPoint, data: {
        "order_id": idProject,
        "saltMeasurement": saltMeasurement,
        "motorMeasurement": motorMeasurement
      });
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> doneDeactivate({required int idDeactivate}) async {
    try {
      Response response = await dio!.post(doneDeactivateRepresentativeEndPoint,
          data: {"deactivate_id": idDeactivate});
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> cancelDeactivate(
      {required int idDeactivate, required String note}) async {
    try {
      Response response = await dio!.post(
          cancelDeactivateRepresentativeEndPoint,
          data: {"deactivate_id": idDeactivate, "notes": note});
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> doneCollecting({required int idCollecting}) async {
    try {
      Response response = await dio!.post(doneCollectingRepresentativeEndPoint,
          data: {"collecting_id": idCollecting});
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }

  Future<dynamic> cancelCollecting(
      {required int idCollecting,
      required String note,
      required String collectingDelay}) async {
    try {
      Response response =
          await dio!.post(delayCollectingRepresentativeEndPoint, data: {
        "collecting_id": idCollecting,
        "notes": note,
        "collecting_delay": collectingDelay
      });
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {}
    }
  }
}
