import 'package:keleya_app/src/shared/models/UserModel.dart';
import 'package:keleya_app/src/shared/repository/UserRepository.dart';
import 'package:keleya_app/src/shared/service/UserService.dart';
import 'package:test/test.dart';

main() {
  UserService? userService;

  setUp(() {
    userService = UserService(UserRepository());
  });

  group("Sign in a user", () {
    test("Should be able to sign in", () async {
      final user = UserModel(
        email: 'joyce@gmail.com',
        password: 'rosapedro',
      );

      final response = await userService?.signIn(user.email,user.password);

      expect(response?.isNotEmpty,true);
      expect(response, 'sucess');
    });

    test("Should not signIn - wrong password", () async {
      final user = UserModel(
        email: 'joyce@gmail.com',
        password: 'rosapedrortr',
      );

      final response = await userService?.signIn(user.email,user.password);

      expect(response?.isNotEmpty,true);
      expect(response, 'Email or password incorrect');
    });
  });

  test("Should not signIn - user dosn't exist", () async {
    final user = UserModel(
      email: 'ttttttttt@gmail.com',
      password: 'rosapedrortr',
    );

    final response = await userService?.signIn(user.email,user.password);

    expect(response?.isNotEmpty,true);
    expect(response, 'user not exist');
  });
}
