abstract class AuthLocalDataSource {
  Future<void> setToken(String token);
  Future<String?> getToken(String token);
  Future<void> deleteToken();
}
