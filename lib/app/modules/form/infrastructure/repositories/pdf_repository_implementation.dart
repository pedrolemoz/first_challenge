import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/pdf_repository.dart';
import '../datasources/pdf_datasource.dart';

part 'pdf_repository_implementation.g.dart';

@Injectable()
class PDFRepositoryImplementation implements PDFRepository {
  final PDFDataSource dataSource;

  PDFRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, File>> getPDFFromStorage() async {
    try {
      final file = await dataSource.getPDFFromStorage();
      return right(file);
    } on PDFException {
      return left(UnableToGetPDFFailure());
    }
  }
}
