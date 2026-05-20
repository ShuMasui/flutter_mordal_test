abstract class StorageRepo<T> {
  Future<void> saveData(T data);
  Future<T?> getData(String id);
  Future<void> deleteData(String id);
  Future<List<T>> getAllData();
  Future<void> updateData(String id, T newData);
  Stream<List<T>> watchAllData();
}
