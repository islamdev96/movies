import 'package:movies/core/network/error_message_model.dart';

class ServirException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServirException({required this.errorMessageModel});
}

// Path: lib\core\error\exceptions.dart
class LocalDataSourcesException implements Exception {
  final ErrorMessageModel errorMessageModel;

  LocalDataSourcesException({required this.errorMessageModel});
}
