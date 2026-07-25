abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);
}

class RemoteException extends AppException {
  const RemoteException(super.message);
}

class LocaleException extends AppException {
  const LocaleException(super.message);
}
