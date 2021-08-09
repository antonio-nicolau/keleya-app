import 'package:keleya_app/src/shared/models/UserModel.dart';

abstract class IUserRepository {
  Future<String?> createUser(UserModel user);
  Future<String?> signIn(email,password);
}
