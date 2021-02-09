import 'dart:io';

abstract class UploadDataSource {
  Future<void> uploadFileToWeb(File file);
}
