import 'package:cam_we_go/data/models/road_sign.dart';
import 'package:http/http.dart';

import '../../domain/repositories/road_sign.dart';

class RoadSignRepositoryImpl implements RoadSignRepository {
  const RoadSignRepositoryImpl({required this.client, required this.authToken});
  @override
  final Client client;
  @override
  final String authToken;
  @override
  Future<List<RoadSign>> getAllRoadSigns() {
    // TODO: implement getAllRoadSigns
    throw UnimplementedError();
  }

  @override
  Future<RoadSign> getRoadSignById(int id) {
    // TODO: implement getRoadSignById
    throw UnimplementedError();
  }

  @override
  Future<RoadSign> getRoadSignByName(String name) {
    // TODO: implement getRoadSignByName
    throw UnimplementedError();
  }
}