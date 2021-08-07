import 'package:keleya_app/src/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'IUserRepository.dart';
import 'endpoints.dart';

class UserRepository implements IUserRepository {

  Future<String?> createUser(UserModel user) async {
    final response = await http.post(Endpoints.createUser, body: user.toJson());

    if (response.statusCode == 200) {
      final token = response.headers['token'];
      if (token?.isEmpty == true)
        return throw response.body;
      return token;
    } else
      return throw response.body;
  }

  Future<String?> signIn(email, password) async {
    final response = await http.post(Endpoints.signIn, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      String? token = response.headers['token'];
      return token;
    } else
      return throw response.body;
  }
}
