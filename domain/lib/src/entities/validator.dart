class Validator {
  // chỉ số nguyên dương
  static bool validateNumber(String text) {
    Pattern pattern = r'^(\(?\+?[0-9]*\)?)?[0-9(\)]*$';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(text);
  }

  // chỉ chữ cái không dấu và số nguyên dương
  static bool validateNumberAndText(String text) {
    Pattern pattern = r"^[0-9a-z]";
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(text);
  }
}
