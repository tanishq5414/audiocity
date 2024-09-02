import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audio_duration/audio_duration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psventuresassignment/models/recording_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IStorageRepository {
  void getPath() {}
  void getFolder() {}
  void createFolder() {}
  void checkPermission() {}
  void saveFile(String path, String fileName) {}
  void getAllFiles() {}
  void getFile(String path) {}
  void storeMetaData(File file, String fileName) {}
  void checkFileNames() {}
  void storeFileNames(bool value) {}
}

class StorageRepository implements IStorageRepository {
  static const _folderName = "PSVentureRecordings";
  static var _path = Directory('storage/emulated/0/$_folderName');

  @override
  Future<String> getPath() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('path')) {
      final newPath = prefs.getString('path')!;
      _path = Directory(newPath);
      return newPath;
    }
    return _path.path;
  }

  @override
  Future<bool> checkFileNames() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('askForFileNames')) {
      return prefs.getBool('askForFileNames')!;
    }
    return false;
  }

  @override
  Future<void> storeFileNames(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('askForFileNames', value);
  }

  @override
  Future<bool> checkPermission() async {
    if (await Permission.storage.isGranted) return true;
    PermissionStatus status = await Permission.manageExternalStorage.request();
    if (status.isGranted) return true;
    return false;
  }

  @override
  Future<Directory> getFolder() async {
    await getPath();
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
  Future<String?> saveFile(String path, String? fileName) async {
    try {
      File file = File(path);
      String newPath = '${_path.path}/${file.path.split('/').last}';
      if(fileName != null){
        newPath = '${_path.path}/$fileName';
      }
      var externalFile = await file.copy(newPath);
      await storeMetaData(externalFile, externalFile.path.split('/').last);
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

  Future<String?> selectNewFolder() async {
    String? selectedPath = await FilePicker.platform.getDirectoryPath();
    final prefs = await SharedPreferences.getInstance();

    if (selectedPath == null) return null;

    await prefs.setString('path', selectedPath);
    await prefs.setStringList("recordingsMetaData", []);
    _path = Directory(selectedPath);

    return selectedPath;
  }
}
