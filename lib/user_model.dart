import 'dart:convert';

class userModel {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? userId;
  string? uid;

  userModel({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.userId,
    this.uid,
  });

  userModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? userId,
    string? uid,
  }) {
    return userModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(name != null){
      result.addAll({'name': name});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
    if(phoneNumber != null){
      result.addAll({'phoneNumber': phoneNumber});
    }
    if(userId != null){
      result.addAll({'userId': userId});
    }
    if(uid != null){
      result.addAll({'uid': uid!.toMap()});
    }
  
    return result;
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phoneNumber: map['phoneNumber'],
      userId: map['userId'],
      uid: map['uid'] != null ? string.fromMap(map['uid']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory userModel.fromJson(String source) =>
      userModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'userModel(name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, userId: $userId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is userModel &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.phoneNumber == phoneNumber &&
      other.userId == userId &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      userId.hashCode ^
      uid.hashCode;
  }
}
