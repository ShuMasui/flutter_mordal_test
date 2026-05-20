// Dart imports:
import 'dart:async';

// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_mordal_test/core/type/diary.dart';
import './storage_repo.dart';

part 'storage_impl.g.dart';

@Riverpod(keepAlive: true)
StorageImpl storage(Ref ref) {
  return StorageImpl();
}

class StorageImpl implements StorageRepo<Diary> {
  final List<Diary> _cache = [];
  final StreamController<List<Diary>> _diaryStreamController =
      StreamController<List<Diary>>();

  @override
  Future<void> deleteData(String id) async {
    final Completer<void> completer = Completer<void>();

    _cache.removeWhere((diary) => diary.id == id);
    _diaryStreamController.add(_cache);
    completer.complete();

    return completer.future;
  }

  @override
  Future<List<Diary>> getAllData() async {
    final Completer<List<Diary>> completer = Completer<List<Diary>>();

    completer.complete(_cache);

    return completer.future;
  }

  @override
  Future<Diary?> getData(String id) {
    final Completer<Diary?> completer = Completer<Diary?>();
    try {
      final diary = _cache.firstWhere((diary) => diary.id == id);
      completer.complete(diary);
    } catch (e) {
      completer.complete(null);
    }
    return completer.future;
  }

  @override
  Future<void> saveData(Diary data) {
    final Completer<void> completer = Completer<void>();

    _cache.add(data);
    _diaryStreamController.sink.add(_cache);
    completer.complete();

    return completer.future;
  }

  @override
  Future<void> updateData(String id, Diary newData) {
    final Completer<void> completer = Completer<void>();

    final index = _cache.indexWhere((diary) => diary.id == id);
    if (index != -1) {
      _cache[index] = newData;
      _diaryStreamController.add(_cache);
    } // else はエラー
    completer.complete();

    return completer.future;
  }

  @override
  Stream<List<Diary>> watchAllData() {
    return _diaryStreamController.stream;
  }
}
