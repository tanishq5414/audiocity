import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class IStorageRepository {
  void getFolder() {}
  void createFolder() {}
  void checkPermission() {}
  void saveFile(String path) {}
  void getAllFiles() {}
}

class StorageRepository implements IStorageRepository {
  static const _folderName = "PSVentureRecordings";
  final _path = Directory('storage/emulated/0/$_folderName');

  @override
  Future<bool> checkPermission() async {
    if (await Permission.storage.isGranted) return true;
    PermissionStatus status = await Permission.manageExternalStorage.request();
    if (status.isGranted) return true;
    return false;
  }

  @override
  Future<Directory> getFolder() async {
    if (!await _path.exists()) {
      await createFolder();
    }
    return _path;
  }

  @override
  Future<void> createFolder() async {
    await _path.create();
    return;
  }

  @override
  Future<String?> saveFile(String path) async {
    try {
      File file = File(path);
      String newPath = '${_path.path}/${file.path.split('/').last}';
      await file.copy(newPath);
      return newPath;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<FileSystemEntity>?> getAllFiles() async {
    List<FileSystemEntity> files = [];
    try {
      var completer = Completer<List<FileSystemEntity>>();
      var lister = _path.list(recursive: false);
      lister.listen((file) {
        files.add(file);
      }, onDone: () {
        completer.complete(files);
      });
      return completer.future;
    } catch (e) {
      return files;
    }
  }
}
