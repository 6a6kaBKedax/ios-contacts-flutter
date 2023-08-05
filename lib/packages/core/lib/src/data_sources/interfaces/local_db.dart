abstract interface class LocalDbDataSource {
  Future put<T>(List<T> values);

  Future<List<T?>> get<T>({List<int>? ids});

  Future remove<T>(List<int> ids);
}
