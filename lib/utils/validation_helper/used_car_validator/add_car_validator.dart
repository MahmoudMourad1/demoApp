
import 'package:user/utils/app_utils/app_strings.dart';

class AddCarValidationForm {

  static String? addCarValidator(value) {
    if (value == null||value.isEmpty) {
      return '';
    }
    return null;
  }
  static String? adValidator(value) {
    if (value == null) {
      // return AppStrings.fieldRequired;
    }
    return null;
  }

}
