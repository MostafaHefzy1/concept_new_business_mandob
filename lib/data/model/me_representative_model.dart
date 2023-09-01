class MeRepresentativeModel {
  Data? data;
  String? message;
  int? status;

  MeRepresentativeModel({this.data, this.message, this.status});

  MeRepresentativeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  List<Employees>? employees;

  Data({this.employees});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }
}

class Employees {
  Store? store;

  Employees({
    this.store,
  });

  Employees.fromJson(Map<String, dynamic> json) {
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }
}

class Store {
  String? nameAr;
  String? firstPhone;
  String? secondPhone;
  String? address;

  Store({
    this.nameAr,
    this.firstPhone,
    this.secondPhone,
    this.address,
  });

  Store.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    firstPhone = json['first_phone'];
    secondPhone = json['second_phone'];
    address = json['address'];
  }
}
