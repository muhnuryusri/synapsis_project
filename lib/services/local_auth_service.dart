import 'package:local_auth/local_auth.dart';
import 'package:logging/logging.dart';

class LocalAuth {
  final _auth = LocalAuthentication();

  Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
        localizedReason: 'Gunakan fingerprint untuk masuk',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      Logger('error $e');
      return false;
    }
  }
}
