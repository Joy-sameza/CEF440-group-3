import 'package:http/http.dart';

abstract class RoadStateRepository {
  const RoadStateRepository({required Client client, required String authToken}) : _client = client;
  final Client _client;
  static const String baseRoute = '/roadstate';
}