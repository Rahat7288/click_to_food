class SendOtpModel {
  SendOtpModel({
      this.message,});

  SendOtpModel.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;
SendOtpModel copyWith({  String? message,
}) => SendOtpModel(  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}