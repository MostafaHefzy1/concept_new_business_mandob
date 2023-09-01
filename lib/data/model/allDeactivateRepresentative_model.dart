class AllDeactivateRepresentativeModel {
  List<DeactivateRepresentative>? data;
  var message;
  var status;

  AllDeactivateRepresentativeModel({this.data, this.message, this.status});

  AllDeactivateRepresentativeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DeactivateRepresentative>[];
      json['data'].forEach((v) {
        data!.add(new DeactivateRepresentative.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

}

class DeactivateRepresentative {
  var id;
  var type;
  var description;
  var notes;
  var status;
  var serviceDone;
  var qualityDone;
  var technicalDone;
  var visitorDone;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var productId;
  var userId;
  var employeeId;
  var serviceEmployeeId;
  User? user;
  Product? product;

  DeactivateRepresentative(
      {this.id,
      this.type,
      this.description,
      this.notes,
      this.status,
      this.serviceDone,
      this.qualityDone,
      this.technicalDone,
      this.visitorDone,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.productId,
      this.userId,
      this.employeeId,
      this.serviceEmployeeId,
      this.user,
      this.product});

  DeactivateRepresentative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    notes = json['notes'];
    status = json['status'];
    serviceDone = json['service_done'];
    qualityDone = json['quality_done'];
    technicalDone = json['technical_done'];
    visitorDone = json['visitor_done'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    productId = json['product_id'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    serviceEmployeeId = json['service_employee_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
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
