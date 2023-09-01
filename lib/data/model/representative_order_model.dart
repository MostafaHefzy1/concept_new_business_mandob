import 'allDeactivateRepresentative_model.dart';

class AllOrderRepresentativeModel {
  List<OrderRepresentative>? data;
  var message;
  var status;

  AllOrderRepresentativeModel({this.data, this.message, this.status});

  AllOrderRepresentativeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderRepresentative>[];
      json['data'].forEach((v) {
        data!.add(new OrderRepresentative.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }


}

class OrderRepresentative {
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
  User? user;
  List<OrderItems>? orderItems;

  OrderRepresentative(
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
      this.user,
      this.orderItems});

  OrderRepresentative.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  
}





class OrderItems {
  var id;
  int ? quantity;
  var price;
  var totalPrice;
  var createdAt;
  var updatedAt;
  var deletedAt;
  var rstatus;
  var orderId;
  var productId;
  Product? product;

  OrderItems(
      {this.id,
      this.quantity,
      this.price,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.rstatus,
      this.orderId,
      this.productId,
      this.product});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    rstatus = json['rstatus'];
    orderId = json['order_id'];
    productId = json['product_id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
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
