import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List props = const <dynamic>[]]);
}

class UnableToGetPDFFailure extends Failure {
  @override
  List<Object> get props => const <dynamic>[];
}

class UploadFailure extends Failure {
  @override
  List<Object> get props => const <dynamic>[];
}
