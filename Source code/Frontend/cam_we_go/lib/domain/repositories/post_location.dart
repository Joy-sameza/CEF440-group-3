import 'package:http/http.dart';
import 'package:location/location.dart';

import '../../core/utils/enum.dart';
import '../../data/models/post_location.dart';

abstract class PostLocationRepository {
  const PostLocationRepository(
      {required Client client, required String authToken})
      : _client = client;
  final Client _client;
  static const String baseRoute = '/post';

  Future<List<PostLocation>> getAllPosts({
    required String authToken,
    required LocationData location,
    required Direction direction,
  });
}
