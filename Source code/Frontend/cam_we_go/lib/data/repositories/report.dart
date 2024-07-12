import 'package:http/http.dart';

import '../../domain/repositories/report.dart';

class ReportRepositoryImpl implements ReportRepository {
  const ReportRepositoryImpl({required this.client, required this.authToken});
  @override
  final Client client;
  @override
  final String authToken;

  @override
  Future<void> sendReport(String report) {
    // TODO: implement sendReport
    throw UnimplementedError();
  }
}
