import 'package:http/http.dart';

import '../../data/models/user.dart';

abstract class UserRepository {
  const UserRepository({required Client client}) : _client = client;
  final Client _client;

  static const baseRoute = '/users';
  static const Map<String, String> baseHeaders = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Future<Map<String, dynamic>?> create(User user);
  Future<Map<String, dynamic>?> login(User user);
  Future<Map<String, dynamic>?> update(User user, {required String authToken});
}
