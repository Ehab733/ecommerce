import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  // حالات التسجيل (Register)
  const factory AuthState.registerLoading() = _RegisterLoading;
  const factory AuthState.registerSuccess() = _RegisterSuccess;
  const factory AuthState.registerError({required String messageError}) =
      _RegisterError;

  // حالات تسجيل الدخول (Login)
  const factory AuthState.loginLoading() = _LoginLoading;
  const factory AuthState.loginSuccess() = _LoginSuccess;
  const factory AuthState.loginError({required String messageError}) =
      _LoginError;

  // حالات تسجيل الخروج (Logout)
  const factory AuthState.logoutLoading() = _LogoutLoading;
  const factory AuthState.logoutSuccess() = _LogoutSuccess;
  const factory AuthState.logoutError({required String messageError}) =
      _LogoutError;
}
