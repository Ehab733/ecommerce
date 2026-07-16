import 'package:dio/dio.dart';
import 'package:ecommerce/core/contants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {

  @singleton
  Dio dio() =>  Dio(
    BaseOptions(
      baseUrl: APIConstants.baseURL,
      receiveDataWhenStatusError: true,
    ),
  );

  @preResolve 
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}