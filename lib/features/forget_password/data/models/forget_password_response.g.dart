// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => _ForgetPasswordResponse(
  status: json['status'] as String? ?? '',
  message: json['message'] as String?,
);

Map<String, dynamic> _$ForgetPasswordResponseToJson(
  _ForgetPasswordResponse instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
