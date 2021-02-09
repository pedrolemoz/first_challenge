import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class PDFRepository {
  Future<Either<Failure, File>> getPDFFromStorage();
}
