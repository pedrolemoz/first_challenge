import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/upload_repository.dart';

part 'upload_file_to_web.g.dart';

@Injectable()
class UploadFileToWeb {
  final UploadRepository repository;

  UploadFileToWeb(this.repository);

  Future<Either<Failure, void>> call({@required File file}) async {
    return await repository.uploadFileToWeb(file);
  }
}
