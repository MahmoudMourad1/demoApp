
import 'package:user/utils/cache_utils/pref_keys.dart';

import '../helpers/cache_helper.dart';

class CacheVars {
  static bool? get isDark => CacheHelper.getData(key: PrefKeys.isDark);
  static String? get token => CacheHelper.getData(key: PrefKeys.token);
  static bool? get currentLanguage => CacheHelper.getData(key: PrefKeys.language);
  static bool? get isSelectLanguage => CacheHelper.getData(key: PrefKeys.isSelectLanguage);
  static String? get userData => CacheHelper.getData(key: PrefKeys.userData);

}
