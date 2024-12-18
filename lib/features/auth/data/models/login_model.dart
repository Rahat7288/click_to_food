class LoginModel {
  LoginModel({
      this.result, 
      this.isAuthenticated, 
      this.id, 
      this.userFName, 
      this.userLName, 
      this.phoneNumber, 
      this.userName, 
      this.tokenString, 
      this.refreshToken,});

  LoginModel.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    isAuthenticated = json['isAuthenticated'];
    id = json['id'];
    userFName = json['userFName'];
    userLName = json['userLName'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    tokenString = json['tokenString'];
    refreshToken = json['refreshToken'];
  }
  Result? result;
  bool? isAuthenticated;
  String? id;
  dynamic userFName;
  dynamic userLName;
  dynamic phoneNumber;
  String? userName;
  String? tokenString;
  String? refreshToken;
LoginModel copyWith({  Result? result,
  bool? isAuthenticated,
  String? id,
  dynamic userFName,
  dynamic userLName,
  dynamic phoneNumber,
  String? userName,
  String? tokenString,
  String? refreshToken,
}) => LoginModel(  result: result ?? this.result,
  isAuthenticated: isAuthenticated ?? this.isAuthenticated,
  id: id ?? this.id,
  userFName: userFName ?? this.userFName,
  userLName: userLName ?? this.userLName,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  userName: userName ?? this.userName,
  tokenString: tokenString ?? this.tokenString,
  refreshToken: refreshToken ?? this.refreshToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['isAuthenticated'] = isAuthenticated;
    map['id'] = id;
    map['userFName'] = userFName;
    map['userLName'] = userLName;
    map['phoneNumber'] = phoneNumber;
    map['userName'] = userName;
    map['tokenString'] = tokenString;
    map['refreshToken'] = refreshToken;
    return map;
  }

}

class Result {
  Result({
      this.succeeded, 
      this.isLockedOut, 
      this.isNotAllowed, 
      this.requiresTwoFactor,});

  Result.fromJson(dynamic json) {
    succeeded = json['succeeded'];
    isLockedOut = json['isLockedOut'];
    isNotAllowed = json['isNotAllowed'];
    requiresTwoFactor = json['requiresTwoFactor'];
  }
  bool? succeeded;
  bool? isLockedOut;
  bool? isNotAllowed;
  bool? requiresTwoFactor;
Result copyWith({  bool? succeeded,
  bool? isLockedOut,
  bool? isNotAllowed,
  bool? requiresTwoFactor,
}) => Result(  succeeded: succeeded ?? this.succeeded,
  isLockedOut: isLockedOut ?? this.isLockedOut,
  isNotAllowed: isNotAllowed ?? this.isNotAllowed,
  requiresTwoFactor: requiresTwoFactor ?? this.requiresTwoFactor,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['succeeded'] = succeeded;
    map['isLockedOut'] = isLockedOut;
    map['isNotAllowed'] = isNotAllowed;
    map['requiresTwoFactor'] = requiresTwoFactor;
    return map;
  }

}