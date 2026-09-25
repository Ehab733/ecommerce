import 'package:freezed_annotation/freezed_annotation.dart';


part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = _Loading;
  const factory ForgetPasswordState.error({required String message}) = _Error;
  const factory ForgetPasswordState.success() = _Success;
}
