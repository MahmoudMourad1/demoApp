

import 'package:user/utils/cache_utils/pref_keys.dart';
import 'package:user/utils/helpers/cache_helper.dart';

class CacheSave {
  static SaveIsDarkTheme(id) async =>
      await CacheHelper.saveData(key: PrefKeys.isDark, value: id);
  static SaveToken(token) async =>
      await CacheHelper.saveData(key: PrefKeys.token, value: token);
  static SaveUserData(userData) async =>
      await CacheHelper.saveData(key: PrefKeys.userData, value: userData);
  static SaveLanguage(String language) async =>
      await CacheHelper.saveData(key: PrefKeys.language, value: language);
  static SaveisSelectLanguage(bool language) async =>
      await CacheHelper.saveData(key: PrefKeys.isSelectLanguage, value: language);
}
