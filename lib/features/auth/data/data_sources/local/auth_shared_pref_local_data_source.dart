import 'package:ecommerce/core/contants/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharePref;

  const AuthSharedPrefLocalDataSource(this._sharePref);

  @override
  Future<void> setToken(String token) async {
    try {
      
      await _sharePref.setString(CasheConstants.tokenKey, token);
    } catch (error) {
      throw const LocaleException('Failed to save token');
    }
  }

  @override
  Future<String?> getToken(String token) async {
    try {
      
      return _sharePref.getString(CasheConstants.tokenKey);
    } catch (error) {
      throw const LocaleException('Failed to get token');
    }
  }
}
