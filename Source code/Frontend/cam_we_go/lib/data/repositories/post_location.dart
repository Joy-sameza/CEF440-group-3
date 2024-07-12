import 'package:http/http.dart';
import 'package:location/location.dart';

import '../../core/utils/enum.dart';
import '../../domain/repositories/post_location.dart';
import '../models/post_location.dart';

class PostLocationRepositoryImpl implements PostLocationRepository {
  const PostLocationRepositoryImpl(
      {required Client client, required String authToken})
      : _client = client;
  final Client _client;
  static const String baseRoute = '/post';

  @override
  Future<List<PostLocation>> getAllPosts({
    required String authToken,
    required LocationData location,
    required Direction direction,
  }) {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }
}
