import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/upload_repository.dart';
import '../datasources/upload_datasource.dart';

part 'upload_repository_implementation.g.dart';

@Injectable()
class UploadRepositoryImplementation implements UploadRepository {
  final UploadDataSource dataSource;

  UploadRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, void>> uploadFileToWeb(File file) async {
    try {
      await dataSource.uploadFileToWeb(file);
      return right(Future.value());
    } on UploadException {
      return left(UploadFailure());
    }
  }
}
