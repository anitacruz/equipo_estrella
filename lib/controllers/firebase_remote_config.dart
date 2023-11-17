import 'package:equipo_estrella/controllers/firebase_remote_config_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logger/logger.dart';

class FirebaseRemoteConfigService {
  var logger = Logger();
  FirebaseRemoteConfigService() : _remoteConfig = FirebaseRemoteConfig.instance;

  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  String getString(String key) => _remoteConfig.getString(key);
  int getInt(String key) => _remoteConfig.getInt(key);
  double getDouble(String key) => _remoteConfig.getDouble(key);

  final FirebaseRemoteConfig _remoteConfig;

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 5),
        ),
      );

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
        const {
          FirebaseRemoteConfigKeys.allowFaving: true,
        },
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();
  }

  Future<void> init() async {
    await _setConfigSettings();
    await _setDefaults();
    await fetchAndActivate();
  }

  bool get allowFaving {
    logger.i("estoy entrando al metodo del firebase remote config!!");
    logger.i("allowFaving: ${getBool(FirebaseRemoteConfigKeys.allowFaving)}");
    return getBool(FirebaseRemoteConfigKeys.allowFaving);
  }
}
