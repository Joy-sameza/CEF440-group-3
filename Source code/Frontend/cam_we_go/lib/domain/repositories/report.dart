import 'package:http/http.dart';

abstract class ReportRepository {
  const ReportRepository({required this.client, required this.authToken});
  final Client client;
  final String authToken;
  Future<void> sendReport(String report) async {}
}