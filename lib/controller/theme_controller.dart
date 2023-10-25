
import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/utill/app_constants.dart';

import '../helper/cache_helper.dart';

class ThemeController extends BaseController {
  ThemeController() {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    CacheHelper.saveData(key: AppConstants.theme, value: _darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    _darkTheme = CacheHelper.getData(key: AppConstants.theme) ?? false;
    update();
  }
}
