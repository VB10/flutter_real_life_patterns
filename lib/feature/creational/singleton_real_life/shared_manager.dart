// MARK: LAZY SINGLETON
import 'package:shared_preferences/shared_preferences.dart';

class ProjectConstantsLazy {
  ProjectConstantsLazy._();

  static ProjectConstantsLazy instnace = ProjectConstantsLazy._();

  final String projectTitle = "Project X";
}

// MARK: EAGER SINGLETON

abstract class ISharedManager {
  String? getStringValue(SharedKeys keys);
  Future<bool>? setStringValue(SharedKeys keys, String value);
}

class SharedManager implements ISharedManager {
  static SharedManager? _instace;
  SharedPreferences? _preferences;

  SharedManager._();

  static Future<void> initSharedPrefences() async {
    if (SharedManager.instace._preferences != null) return;
    SharedManager.instace._preferences = await SharedPreferences.getInstance();
  }

  static SharedManager get instace {
    if (_instace != null) {
      return _instace!;
    }
    _instace = SharedManager._();
    return _instace!;
  }

  @override
  Future<bool>? setStringValue(SharedKeys keys, String value) async {
    return await _preferences?.setString(keys.toString(), value) ?? false;
  }

  @override
  String? getStringValue(SharedKeys keys) {
    return _preferences?.getString(keys.toString());
  }
}

enum SharedKeys { TOKEN }
