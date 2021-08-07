import 'package:test/test.dart';
import 'package:keleya_app/src/models/UserModel.dart';
import 'package:keleya_app/src/repository/UserRepository.dart';
import 'package:keleya_app/src/service/UserService.dart';

main() {
  UserService? userService;

  setUp(() {
    userService = UserService(UserRepository());
  });

  group("Create a new user", () {
    test("Should be able to create a new user", () async {

      final user = UserModel(
        name: 'TesteKeleya${DateTime.now().microsecond}',
        email: 'testekeleya${DateTime.now().microsecond}@gmail.com',
        password: 'keleyapassword',
        babyBirthDate: DateTime.now(),
        onboardingDone: true,
        acceptPrivatePolicy: true,
        acceptTermConditions: true,
      );

      final response = await userService?.createUser(user);

      expect(response?.isNotEmpty,true);
      expect(response, 'sucess');
    });

   test("Should not be able to create a new user - user exist", () async {
      final user = UserModel(
        name: 'TesteKeleya${DateTime.now().microsecond}',
        email: 'joyce1627864175133@gmail.com',
        password: 'keleyapassword',
        babyBirthDate: DateTime.now(),
        acceptPrivatePolicy: true,
        acceptTermConditions: true,
      );

      final response = await userService?.createUser(user);

      expect(response?.isNotEmpty,true);
      expect(response, 'User already exists');
    });
  });
}
