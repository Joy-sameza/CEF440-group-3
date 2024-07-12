import 'dart:convert';

import 'package:cam_we_go/data/models/user.dart';
import 'package:http/http.dart';

import '../../domain/repositories/user.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required Client client}) : _client = client;
  final Client _client;

  @override
  Future<Map<String, dynamic>?> create(User user) async {
    String path = '${UserRepository.baseRoute}/create';
    try {
      var response = await _client
          .post(
            Uri.parse(path),
            headers: UserRepository.baseHeaders,
            body: user.toJson(),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      }
    } on Exception {
      rethrow;
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> login(User user) async {
    String path = '${UserRepository.baseRoute}/login';
    try {
      var response = await _client
          .post(
            Uri.parse(path),
            headers: UserRepository.baseHeaders,
            body: user.toJson(),
          )
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } on Exception {
      rethrow;
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> update(User user,
      {required String authToken}) async {
    String path = '${UserRepository.baseRoute}/update';
    try {
      var response = await _client
          .put(
            Uri.parse(path),
            headers: {...UserRepository.baseHeaders, 'x-cam_we_go': authToken},
            body: user.toJson(),
          )
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } on Exception {
      rethrow;
    }
  }
}
