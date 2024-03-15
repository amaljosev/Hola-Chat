class UserModel {
  final String uid;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;

  UserModel(
      {required this.uid,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password});
  Map<String, dynamic> toMap() {
    return {
      'userId': uid,
      'user_name': userName,
      'email': email,
      'phone_number': phoneNumber,
      'password': password
    };
  }
}
