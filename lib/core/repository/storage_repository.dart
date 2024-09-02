import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audio_duration/audio_duration.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psventuresassignment/models/recording_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IStorageRepository {
  void getFolder() {}
  void createFolder() {}
  void checkPermission() {}
  void saveFile(String path) {}
  void getAllFiles() {}
  void getFile(String path) {}
  void storeMetaData(File file, String fileName) {}
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
      var externalFile = await file.copy(newPath);
      await storeMetaData(externalFile, file.path.split('/').last);
      return newPath;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<XFile?> getFile(String path) async {
    try {
      File file = File(path);
      XFile xfile = XFile(file.path);
      return xfile;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<RecordingModel>?> getAllFiles() async {
    List<FileSystemEntity> files = [];
    try {
      var completer = Completer<List<FileSystemEntity>>();
      var lister = _path.list(recursive: false);
      lister.listen((file) {
        files.add(file);
      }, onDone: () {
        completer.complete(files);
      });
      files = await completer.future;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<RecordingModel> recordings = [];
      prefs.getStringList('recordingsMetaData')?.forEach((element) {
        Map<String, dynamic> metaData = jsonDecode(element);
        if (files.any((element) => element.path == metaData['filePath'])) {
          recordings.add(RecordingModel(
            fileName: metaData['fileName'],
            filePath: metaData['filePath'],
            creationDate: metaData['creationDate'],
            fileSize: metaData['fileSize'],
            duration: metaData['duration'],
            file: files
                .firstWhere((element) => element.path == metaData['filePath']),
          ));
        } else {
          prefs.getStringList('recordingsMetaData')?.remove(element);
        }
      });
      return recordings.reversed.toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> storeMetaData(File file, String fileName) async {
    try {
      DateTime creationDate = DateTime.now();
      String fileSize = (await file.length()).toString();
      fileSize = (int.parse(fileSize) / 1000000).toStringAsFixed(2);
      int durationInMilliseconds =
          await AudioDuration.getAudioDuration(file.path) ?? 0;
      String duration =
          Duration(milliseconds: durationInMilliseconds).toString();

      final metaData = {
        'filePath': file.path,
        'fileName': fileName,
        'creationDate': creationDate.toString(),
        'fileSize': fileSize,
        'duration': duration,
      };
      final jsonData = jsonEncode(metaData);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> previousList =
          prefs.getStringList('recordingsMetaData') ?? [];
      previousList.add(jsonData);
      await prefs.setStringList('recordingsMetaData', previousList);
    } catch (e) {
      return;
    }
  }
}
