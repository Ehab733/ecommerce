import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/useCases/login_usecase.dart';
import 'package:ecommerce/features/auth/domain/useCases/logout_usecase.dart';
import 'package:ecommerce/features/auth/domain/useCases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_state.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final LogoutUsecase _logoutUsecase;

  AuthCubit({
    required this._loginUsecase,
    required this._registerUsecase,
    required this._logoutUsecase,
  }) : super(const AuthState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const AuthState.loginLoading());
    Logger().d('Loading');

    final result = await _loginUsecase(request);
    result.fold(
      (error) {
        emit(AuthState.loginError(messageError: error.message));
        Logger().e(error.message);
      },
      (_) {
        emit(const AuthState.loginSuccess());
        Logger().d('Success');
      },
    );
  }

  Future<void> register(RegisterRequest request) async {
    emit(const AuthState.registerLoading());
    Logger().d('Loading');
    final result = await _registerUsecase(request);
    result.fold(
      (error) {
        emit(AuthState.registerError(messageError: error.message));
        Logger().e(error.message);
      },
      (_) {
        emit(const AuthState.registerSuccess());
        Logger().d('Success');
      },
    );
  }

  Future<void> logout() async {
    emit(const AuthState.logoutLoading()); // أو LogoutLoading()

    final result = await _logoutUsecase();

    // 🎯 تأخير بسيط جداً لمنع الـ Race Condition مع الـ Dialog
    await Future.delayed(const Duration(milliseconds: 300));

    result.fold(
      (failure) => emit(AuthState.logoutError(messageError: failure.message)),
      (_) => emit(const AuthState.logoutSuccess()),
    );
  }
}
