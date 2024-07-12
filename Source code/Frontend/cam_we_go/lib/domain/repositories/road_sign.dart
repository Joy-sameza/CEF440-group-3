import 'package:http/http.dart';

import '../../data/models/road_sign.dart';

abstract class RoadSignRepository {
  const RoadSignRepository({required this.client, required this.authToken});
  final Client client;
  final String authToken;
  static const baseRoute = '/roadsign';

  Future<List<RoadSign>> getAllRoadSigns();
  Future<RoadSign> getRoadSignById(int id);
  Future<RoadSign> getRoadSignByName(String name);
}
