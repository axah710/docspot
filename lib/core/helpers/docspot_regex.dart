class DocspotRegex {
  // DocspotRegex is used to group together various regular expression (regex)
  //validations related to email, password, and phone number formats.
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }
  // This line creates a regular expression to validate an email address and uses
  // the hasMatch method to check if the provided email matches the pattern.

  // The regex r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$'
  // ensures the email has:

  // At least one character before the @.
  // One or more letters before the ..
  // One or more letters after the ..
  // Optionally, another . followed by one or more letters.

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }
  // This regex checks if the password string meets the following conditions:

  // At least one lowercase letter (?=.*[a-z]).
  // At least one uppercase letter (?=.*[A-Z]).
  // At least one digit (?=.*\d).
  // At least one special character from the set @$!%*?& (?=.*[@$!%*?&]).
  // At least 8 characters long (.{8,}$).

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }
  // The regex r'^(010|011|012|015)[0-9]{8}$' checks if the phoneNumber:

  // Starts with 010, 011, 012, or 015.
  // Followed by exactly 8 digits ([0-9]{8}).

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }
  // The regex r'^(?=.*[a-z])' ensures there is at least one lowercase
  //letter in the password.

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }
  // The regex r'^(?=.*[A-Z])' ensures there is at least one uppercase
  // letter in the password.

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }
  // The regex r'^(?=.*?[0-9])' ensures there is at least one numbers.

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }
  // The regex r'^(?=.*?[#?!@$%^&*-])' ensures there is at least one special.

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
  // The regex r'^(?=.{8,})' ensures the password is at least 8 characters.
}
