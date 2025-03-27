import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';

class FileHelper {
  static MultipartFile getMultiPartFile(File? file)  =>
      MultipartFile.fromFileSync(file?.path ?? '',
          filename: path.basename(file?.path ?? ''));

  static getBaseName(File? file)  => path.basename(file?.path ?? '');
}
class XFileHelper {
  static MultipartFile getMultiPartFile(XFile? file)  =>
      MultipartFile.fromFileSync(file?.path ?? '',
          filename: path.basename(file?.path ?? ''));

  static Future<XFile> getImageXFileByUrl(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    XFile result = await XFile(file.path);
    return result;
  }

  static getBaseName(XFile? file)  => path.basename(file?.path ?? '');
}