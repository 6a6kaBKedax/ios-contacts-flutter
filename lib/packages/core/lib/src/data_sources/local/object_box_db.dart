import 'package:core/objectbox.g.dart';
import 'package:core/src/data_sources/interfaces/local_db.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBoxLocalDbSourceImp implements LocalDbDataSource {
  /// The Store of this app.
  late final Store store;

  ObjectBoxLocalDbSourceImp._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  static Future<ObjectBoxLocalDbSourceImp> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx"));
    return ObjectBoxLocalDbSourceImp._create(store);
  }

  @override
  Future put<T>(List<T> values) async {
    final box = store.box<T>();
    if (values.length == 1) {
      await box.putAsync(values.first);
    } else {
      await box.putManyAsync(values);
    }
  }

  @override
  Future<List<T?>> get<T>({List<int>? ids}) async {
    final box = store.box<T>();
    if (ids == null) {
      return await box.getAllAsync();
    } else if (ids.length == 1) {
      return [await box.getAsync(ids.first)];
    } else {
      return await box.getManyAsync(ids);
    }
  }

  @override
  Future remove<T>(List<int> ids) async {
    final box = store.box<T>();
    if (ids.length == 1) {
      await box.removeAsync(ids.first);
    } else {
      await box.removeManyAsync(ids);
    }
  }
}
