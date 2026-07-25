import 'package:ecommerce/features/auth/data/models/user_model.dart';

class LoginResponse {
  final String message;
  final UserModel user;
  final String token;

  const LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json["message"],
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );
}
