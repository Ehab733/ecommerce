import 'package:ecommerce/features/auth/data/models/login/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register/register_request.dart';
import 'package:ecommerce/features/auth/domain/useCases/login_usecase.dart';
import 'package:ecommerce/features/auth/domain/useCases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth/auth_state.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  
  AuthCubit({required this._loginUsecase, required this._registerUsecase}) : super(AuthInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    Logger().d('Loading');

    final result = await _loginUsecase(request);
    result.fold(
      (error) {
        emit(LoginError(error.message));
        Logger().e(error.message);
      },
      (_) {
        emit(LoginSuccess());
        Logger().d('Success');
      },
    );
  }

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    Logger().d('Loading');
    final result = await _registerUsecase(request);
    result.fold(
      (error) {
        emit(RegisterError(error.message));
        Logger().e(error.message);
      },
      (_) {
        emit(RegisterSuccess());
        Logger().d('Success');
      },
    );
  }
}
