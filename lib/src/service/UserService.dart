import 'package:keleya_app/src/controllers/localStorage.dart';
import 'package:keleya_app/src/models/UserModel.dart';
import 'package:keleya_app/src/repository/IUserRepository.dart';
import 'IUserService.dart';

class UserService implements IUserService {
  IUserRepository _userRepository;

  UserService(this._userRepository);

  Future<String?> signIn(email,password) async {
    try {
      final response = await _userRepository.signIn(email,password);

      if (response?.isNotEmpty == true) {
        await LocalStorage().saveToken(response);
        return 'sucess';
      }
    } on String catch (error) {
      return error.toString().replaceAll('\"', '');
    }
  }

  Future<String?> createUser(UserModel user) async {
    try {
      final response = await _userRepository.createUser(user);
      print("response: $response");
      if (response?.isNotEmpty == true) return 'sucess';
    } on String catch (error) {
      return error.toString().replaceAll('\"', '');
    }
  }
}
