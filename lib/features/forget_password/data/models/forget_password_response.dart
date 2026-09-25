import 'package:freezed_annotation/freezed_annotation.dart';


part 'forget_password_response.freezed.dart';
part 'forget_password_response.g.dart';

@freezed
abstract class ForgetPasswordResponse with _$ForgetPasswordResponse {
  const factory ForgetPasswordResponse({
    @Default('') String status,
     String? message,
  }) = _ForgetPasswordResponse;

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}