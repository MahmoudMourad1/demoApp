import 'package:localize_and_translate/localize_and_translate.dart';

class AppLocalization{
  static init()async{
    await LocalizeAndTranslate.init(
        supportedLanguageCodes: <String>['ar','en'],
        defaultType: LocalizationDefaultType.asDefined,
        assetLoader: const AssetLoaderRootBundleJson('assets/lang/'));
  }
}