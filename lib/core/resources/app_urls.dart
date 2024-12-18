class AppUrls {
  static const String baseUrl = "https://demo-api.devdata.top/api";

  static const String checkUserExists =
      "$baseUrl/Administrator/CheckUserExists";
  static const String login = "$baseUrl/Administrator/Login";
  //for new user
  static const String sendOTPEmail = "$baseUrl/Administrator/SendOTPToEmail";
  static const String checkOTPFromEmail =
      "$baseUrl/Administrator/CheckOTPFromEmail";
  static const String saveUser = '$baseUrl/Administrator/SaveUser';
  static const String regiserAfterOtpVerification =
      '$baseUrl/Administrator/RegisterAfterOTPMatched';
}
