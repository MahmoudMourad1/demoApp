
class ValidationForm {
  static String? phoneValidator(String? value) {
    //validation for egypt phone
    bool isValid =
        RegExp(r"^(\+201|1|00201)[0-2,5]{1}[0-9]{8}").hasMatch(value!);

    if (value.isEmpty) {
      return "[TYPE YOUR TEXT]";
    } else if (value[0] == '0' || value.length < 10 || !isValid) {
      return "[TYPE YOUR TEXT]";
    }
    return null;
  }


  static String? emailValidator(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (value.isEmpty) {
      return "[TYPE YOUR TEXT]";
    } else if (!emailValid) {
      return "[TYPE YOUR TEXT]";
    }
    return null;
  }

  static String? websiteValidator(String? value) {
    bool websiteValid = RegExp(
            r'((http|https)://)?[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?',
            caseSensitive: false)
        .hasMatch(value!);
    if (value.isEmpty) {
      return "[TYPE YOUR TEXT]";
    } else if (!websiteValid) {
      return "[TYPE YOUR TEXT]";
    }
    return null;
  }

  static String? passwordValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return "[TYPE YOUR TEXT]";
    } else if (v!.length <= 5) {
      return "[TYPE YOUR TEXT]";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(
    String v,
    String text,
  ) {
    if (v.isEmpty) {
      return "[TYPE YOUR TEXT]";
    } else if (text != v) {
      return "[TYPE YOUR TEXT]";
    } else {
      return null;
    }
  }
}
