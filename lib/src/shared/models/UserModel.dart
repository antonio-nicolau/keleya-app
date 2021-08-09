class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.babyBirthDate,
    this.onboardingDone,
    this.acceptPrivatePolicy,
    this.acceptTermConditions,
  });

  int? id;
  String? name;
  String? email;
  String? password;
  DateTime? babyBirthDate;
  bool? onboardingDone;
  bool? acceptPrivatePolicy;
  bool? acceptTermConditions;

  toJson() {
    return {
      'id': (id ?? 0).toString(),
      'name': name,
      'email': email,
      'password': password,
      'babyBirthDate': babyBirthDate?.toLocal().toString(),
      'onboardingDone': onboardingDone.toString(),
      'acceptPrivatePolicy': acceptPrivatePolicy.toString(),
      'acceptTermConditions': acceptTermConditions.toString(),
    };
  }
}
