import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:ecommerce/features/forget_password/presentation/manager/cubit/forget_password_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordCubit(this._forgetPasswordRepository)
    : super(ForgetPasswordState.initial());

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordState.loading());
    final response = await _forgetPasswordRepository.forgetPassword(email);
    response.fold(
      (failure) => emit(ForgetPasswordState.error(message: failure.message)),
      (_) => emit(ForgetPasswordState.success()),
    );
  }

  Future<void> codeVerification(String resetCode) async {
    emit(ForgetPasswordState.loading());
    final response = await _forgetPasswordRepository.codeVerification(
      resetCode,
    );
    response.fold(
      (failure) => emit(ForgetPasswordState.error(message: failure.message)),
      (_) => emit(ForgetPasswordState.success()),
    );
  }

  Future<void> resetPassword(String email, String newPassword) async {
    emit(ForgetPasswordState.loading());
    final response = await _forgetPasswordRepository.resetPassword(
      email,
      newPassword,
    );
    response.fold(
      (failure) => emit(ForgetPasswordState.error(message: failure.message)),
      (_) => emit(ForgetPasswordState.success()),
    );
  }
}
