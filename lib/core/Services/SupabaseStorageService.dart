import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart ' as b;
import 'package:supabase_flutter/supabase_flutter.dart';


import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../Helper_Functions/getuser.dart';
import 'Storage-Service.dart';

class SupabaseStorageService implements StoragService {

  static late Supabase _supabase;
  static initsubabase() async {
    _supabase = await Supabase.initialize(
      url: KUrl_of_Project,
      anonKey: Kanonkey,
    );
  }
  @override
  Future<String> UploadFile(File file, String path) async {
    try {
      final extension = b.extension(file.path);
      final fileName = '${getUser().Uid}$extension'; // اسم ثابت لكل مستخدم
      final filePath = '$path/$fileName';
      try {
        // نحذف القديم لو موجود
        await _supabase.client.storage.from(KfruitImages).remove([filePath]);
      } catch (_) {
        // لو مش موجود، عادي
      }

// بعد كده نرفع الصورة الجديدة
      await _supabase.client.storage.from(KfruitImages).upload(filePath, file);

// نجيب الرابط
      final urlResponse = _supabase.client.storage.from(KfruitImages).getPublicUrl(filePath);
      return urlResponse;
    } catch (e, s) {
      log('❌ Error uploading file: $e');
      log('Stack: $s');
      rethrow;
    }
  }
}
