class TextFieldUtilities {
  bool validName(String name) {
    return name.length > 2;
  }

  bool validEmail(String email) {
    if (email.isEmpty) return false;
    String regx =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(regx).hasMatch(email);
  }

  bool validPhoneNumber(String phone) {
    return phone.length == 11;
  }

  bool validPassword(String password) {
    return password.length > 5;
  }
}
