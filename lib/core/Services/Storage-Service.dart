import 'dart:io';

abstract class StoragService {
  Future<String> UploadFile(File file, String path);
}
