class Endpoints{
  static final _baseURL = 'http://192.168.1.122:3000/api';
  static final createUser = Uri.parse(_baseURL + '/users');
  static final signIn = Uri.parse(_baseURL + '/users/auth');
}