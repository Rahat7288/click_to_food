class VerifyOtpModel {
  VerifyOtpModel({
      this.message,});

  VerifyOtpModel.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;
VerifyOtpModel copyWith({  String? message,
}) => VerifyOtpModel(  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}