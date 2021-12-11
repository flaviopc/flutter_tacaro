import 'package:ta_caro/modules/feed/repositories/feed_repository.dart';
import 'package:ta_caro/shared/services/app_database.dart';

class FeedRepositoryImpl implements IFeedRepository {
  final AppDatabase database;
  FeedRepositoryImpl({
    required this.database,
  });
  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return await database.getAll("orders");
  }
}
