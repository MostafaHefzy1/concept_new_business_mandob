import 'package:mandobaswaaq/data/model/representative_order_model.dart';

class AllCollectingRepresentativeModel {
  List<CollectingRepresentative>? collectingRepresentative;
  var message;
  var status;

  AllCollectingRepresentativeModel({this.collectingRepresentative, this.message, this.status});

  AllCollectingRepresentativeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      collectingRepresentative = <CollectingRepresentative>[];
      json['data'].forEach((v) {
        collectingRepresentative!.add(new CollectingRepresentative.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }


}

class CollectingRepresentative {
  var id;
  var value;
  var remain;
  var collectingDate;
  var collectingDelay;
  var status;
  var notes;
  var serviceDone;
  var qualityDone;
  var technicalDone;
  var visitorDone;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var orderId;
  var employeeId;
  var serviceEmployeeId;
  Order? order;

  CollectingRepresentative(
      {this.id,
      this.value,
      this.remain,
      this.collectingDate,
      this.collectingDelay,
      this.status,
      this.notes,
      this.serviceDone,
      this.qualityDone,
      this.technicalDone,
      this.visitorDone,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.orderId,
      this.employeeId,
      this.serviceEmployeeId,
      this.order});

  CollectingRepresentative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    remain = json['remain'];
    collectingDate = json['collecting_date'];
    collectingDelay = json['collecting_delay'];
    status = json['status'];
    notes = json['notes'];
    serviceDone = json['service_done'];
    qualityDone = json['quality_done'];
    technicalDone = json['technical_done'];
    visitorDone = json['visitor_done'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    orderId = json['order_id'];
    employeeId = json['employee_id'];
    serviceEmployeeId = json['service_employee_id'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }


}

class Order {
  var id;
  var tax;
  var discount;
  var shippingPrice;
  var subTotal;
  var total;
  var paid;
  var remain;
  var status;
  var isShippingDifferent;
  var paidType;
  var orderWay;
  var orderType;
  var notes;
  var saltMeasurement;
  var motorMeasurement;
  var serviceDone;
  var qualityDone;
  var technicalDone;
  var visitorDone;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var priceId;
  var storeId;
  var userId;
  var employeeId;
  var adminId;
  var serviceEmployeeId;
  List<OrderItems>? orderItems;
  User? user;

  Order(
      {this.id,
      this.tax,
      this.discount,
      this.shippingPrice,
      this.subTotal,
      this.total,
      this.paid,
      this.remain,
      this.status,
      this.isShippingDifferent,
      this.paidType,
      this.orderWay,
      this.orderType,
      this.notes,
      this.saltMeasurement,
      this.motorMeasurement,
      this.serviceDone,
      this.qualityDone,
      this.technicalDone,
      this.visitorDone,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.priceId,
      this.storeId,
      this.userId,
      this.employeeId,
      this.adminId,
      this.serviceEmployeeId,
      this.orderItems,
      this.user});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tax = json['tax'];
    discount = json['discount'];
    shippingPrice = json['shipping_price'];
    subTotal = json['sub_total'];
    total = json['total'];
    paid = json['paid'];
    remain = json['remain'];
    status = json['status'];
    isShippingDifferent = json['is_shipping_different'];
    paidType = json['paid_type'];
    orderWay = json['order_way'];
    orderType = json['order_type'];
    notes = json['notes'];
    saltMeasurement = json['saltMeasurement'];
    motorMeasurement = json['motorMeasurement'];
    serviceDone = json['service_done'];
    qualityDone = json['quality_done'];
    technicalDone = json['technical_done'];
    visitorDone = json['visitor_done'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    priceId = json['price_id'];
    storeId = json['store_id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    adminId = json['admin_id'];
    serviceEmployeeId = json['service_employee_id'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

}

class Product {
  var id;
  var nameAr;
  var nameEn;
  var barCode;
  var descriptionAr;
  var descriptionEn;
  var sectionalPrice;
  var wholesalePrice;
  var reOrderLimit;
  var guarantee;
  var buyPoints;
  var periodicMaintenance;
  var isInstallment;
  var phases;
  var origin;
  var link;
  var photo;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var categoryId;
  var brandId;

  Product(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.barCode,
      this.descriptionAr,
      this.descriptionEn,
      this.sectionalPrice,
      this.wholesalePrice,
      this.reOrderLimit,
      this.guarantee,
      this.buyPoints,
      this.periodicMaintenance,
      this.isInstallment,
      this.phases,
      this.origin,
      this.link,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.categoryId,
      this.brandId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    barCode = json['bar_code'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    sectionalPrice = json['sectional_price'];
    wholesalePrice = json['wholesale_price'];
    reOrderLimit = json['re_order_limit'];
    guarantee = json['guarantee'];
    buyPoints = json['buy_points'];
    periodicMaintenance = json['periodic_maintenance'];
    isInstallment = json['is_installment'];
    phases = json['phases'];
    origin = json['origin'];
    link = json['link'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
  }

  
}

class User {
  var id;
  var name;
  var email;
  var emailVerifiedAt;
  var phone;
  var otherPhone;
  var whatsappPhone;
  var address;
  var userType;
  var serviceType;
  var taxRecord;
  var commericalRecord;
  var taxPhoto;
  var commericalPhoto;
  var profilePhoto;
  var code;
  var registerCode;
  var status;
  var firebaseToken;
  var goeLocation;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var areaId;
  Area? area;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.otherPhone,
      this.whatsappPhone,
      this.address,
      this.userType,
      this.serviceType,
      this.taxRecord,
      this.commericalRecord,
      this.taxPhoto,
      this.commericalPhoto,
      this.profilePhoto,
      this.code,
      this.registerCode,
      this.status,
      this.firebaseToken,
      this.goeLocation,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.areaId,
      this.area});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    otherPhone = json['other_phone'];
    whatsappPhone = json['whatsapp_phone'];
    address = json['address'];
    userType = json['user_type'];
    serviceType = json['service_type'];
    taxRecord = json['tax_record'];
    commericalRecord = json['commerical_record'];
    taxPhoto = json['tax_photo'];
    commericalPhoto = json['commerical_photo'];
    profilePhoto = json['profile_photo'];
    code = json['code'];
    registerCode = json['register_code'];
    status = json['status'];
    firebaseToken = json['firebase_token'];
    goeLocation = json['goeLocation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    areaId = json['area_id'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }


}

class Area {
  var id;
  var nameAr;
  var nameEn;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var cityId;
  var storeId;
  Store? store;

  Area(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.cityId,
      this.storeId,
      this.store});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

 
}

class Store {
  var id;
  var nameAr;
  var nameEn;
  var firstPhone;
  var secondPhone;
  var address;
  var status;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var areaId;

  Store(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.firstPhone,
      this.secondPhone,
      this.address,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.areaId});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    firstPhone = json['first_phone'];
    secondPhone = json['second_phone'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    areaId = json['area_id'];
  }

 
}
