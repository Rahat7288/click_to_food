class CheckUserExistModel {
  CheckUserExistModel({
      this.status, 
      this.success, 
      this.message,});

  CheckUserExistModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }
  num? status;
  bool? success;
  String? message;
CheckUserExistModel copyWith({  num? status,
  bool? success,
  String? message,
}) => CheckUserExistModel(  status: status ?? this.status,
  success: success ?? this.success,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['message'] = message;
    return map;
  }

}