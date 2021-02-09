import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class UploadRepository {
  Future<Either<Failure, void>> uploadFileToWeb(File file);
}
