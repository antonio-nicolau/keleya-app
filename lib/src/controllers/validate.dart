class Validate {
 static bool? isEmail(String email){
    final reg = r"^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$";
    return RegExp(reg).hasMatch(email);
  }

 static String? isValidPasswords(String password,String confirmPassword){
  if(password.length < 6)
    return 'Password must contain at least 6 letters';
  else if(password !=confirmPassword)
    return 'Passwords dosn\'t match';
  return 'ok';
 }
}
