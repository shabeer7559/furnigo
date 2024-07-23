import 'package:furnigo/models/cartModel.dart';

class BookingModel {
  List cartModels;
  String userName;
  List address;
  String payment;
  int orderAmount;
  int deliveryCharge;
  int total;
  int status;
  String time;
  String date;
  String id;
  BookingModel({
    required this.cartModels,
    required this.userName,
    required this.address,
    required this.payment,
    required this.orderAmount,
    required this.deliveryCharge,
    required this.total,
    required this.status,
    required this.time,
    required this.date,
    required this.id,
  });
  Map<String, dynamic> toMap() {
    return {
      "cartModels": this.cartModels,
      "userName": this.userName,
      "address": this.address,
      "payment": this.payment,
      "orderAmount": this.orderAmount,
      "deliveryCharge": this.deliveryCharge,
      "total": this.total,
      "status": this.status,
      "time": this.time,
      "date": this.date,
      "id": this.id,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      cartModels: map["cartModels"] ?? [],
      userName: map["userName"] ?? "",
      address: map["address"] ?? [],
      payment: map["payment"] ?? 0,
      orderAmount: map["orderAmount"] ?? 0,
      deliveryCharge: map["deliveryCharge"] ?? 0,
      total: map["total"] ?? 0,
      status: map["status"] ?? 0,
      time: map["time"] ?? "",
      date: map["date"] ?? "",
      id: map["id"] ?? "",
    );
  }
  BookingModel copyWith({
    List? cartModels,
    String? userName,
    List? address,
    String? payment,
    int? orderAmount,
    int? deliveryCharge,
    int? total,
    int? status,
    String? time,
    String? date,
    String? id,
  }) {
    return BookingModel(
        cartModels: cartModels ?? this.cartModels,
        userName: userName ?? this.userName,
        address: address ?? this.address,
        payment: payment ?? this.payment,
        orderAmount: orderAmount ?? this.orderAmount,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        total: total ?? this.total,
        status: status ?? this.status,
        time: time ?? this.time,
        date: date ?? this.date,
        id: id ?? this.id);
  }
}
