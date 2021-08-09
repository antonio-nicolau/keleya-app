import 'package:keleya_app/src/shared/controllers/localStorage.dart';
import 'package:keleya_app/src/shared/models/UserModel.dart';
import 'package:keleya_app/src/shared/repository/IUserRepository.dart';
import 'IUserService.dart';

class UserService implements IUserService {
  IUserRepository _userRepository;

  UserService(this._userRepository);

  Future<String?> signIn(email, password) async {
    try {
      final response = await _userRepository.signIn(email, password);

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
      if (response?.isNotEmpty == true) return 'sucess';
    } on String catch (error) {
      return error.toString().replaceAll('\"', '');
    }
  }
}
