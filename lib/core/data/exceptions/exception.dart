import 'dart:developer';

class AppException implements Exception {
  final String? _message;

  AppException([this._message]) {
    log(_message.toString());
  }

  @override
  String toString() {
    return "$_message";
  }
}
