import 'package:keleya_app/src/models/UserModel.dart';

abstract class IUserService {
  Future<String?> createUser(UserModel user);
  Future<String?> signIn(email,password);
}
