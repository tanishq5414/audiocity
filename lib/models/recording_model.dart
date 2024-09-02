// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class RecordingModel {
  final String fileName;
  final String filePath;
  final String creationDate;
  final String fileSize;
  final String duration;
  final FileSystemEntity file;
  RecordingModel({
    required this.fileName,
    required this.filePath,
    required this.creationDate,
    required this.fileSize,
    required this.duration,
    required this.file,
  });
}
