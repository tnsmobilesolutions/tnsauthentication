// import 'dart:convert';

// class userModel {
//   String? name;
//   String? email;
//   String? phoneNumber;
//   String? userId;

//   userModel({
//     this.name,
//     this.email,
//     this.phoneNumber,
//     this.userId,
//   });

//   userModel copyWith({
//     String? name,
//     String? email,
//     String? phoneNumber,
//     String? userId,
//   }) {
//     return userModel(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       userId: userId ?? this.userId,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     if (name != null) {
//       result.addAll({'name': name});
//     }
//     if (email != null) {
//       result.addAll({'email': email});
//     }
//     if (phoneNumber != null) {
//       result.addAll({'phoneNumber': phoneNumber});
//     }
//     if (userId != null) {
//       result.addAll({'userId': userId});
//     }

//     return result;
//   }

//   factory userModel.fromMap(Map<String, dynamic> map) {
//     return userModel(
//       name: map['name'],
//       email: map['email'],
//       phoneNumber: map['phoneNumber'],
//       userId: map['userId'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory userModel.fromJson(String source) =>
//       userModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'userModel(name: $name, email: $email, phoneNumber: $phoneNumber, userId: $userId)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is userModel &&
//         other.name == name &&
//         other.email == email &&
//         other.phoneNumber == phoneNumber &&
//         other.userId == userId;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//         email.hashCode ^
//         phoneNumber.hashCode ^
//         userId.hashCode;
//   }
// }
