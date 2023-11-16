// import 'package:tager/Tager/Presentation/home_tager/presentation/model/user_data_detalise_model.dart';
//
// class UserDataModel{
//   bool? status;
//   String? message;
//   UserDataDetaliseModel? trader;
//   int? countNotifications;
//   UserDataModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     trader =
//     json['trader'] != null ? UserDataDetaliseModel.fromJson(json['trader']) : null;
//     countNotifications = json['count_notifications'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.trader != null) {
//       data['trader'] = this.trader!.toJson();
//     }
//     data['count_notifications'] = this.countNotifications;
//     return data;
//   }
//
// }

import 'package:tager/Tager/Presentation/home_tager/presentation/model/user_data_detalise_model.dart';

class UserData {
  bool? status;
  String? message;
  UserDataDetalise? user;
  bool? address;
  String? token;


  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? UserDataDetalise.fromJson(json['user']) : null;
    address = json['address'];
    token = json['token'];
  }


}