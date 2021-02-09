import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/pdf_repository.dart';

part 'get_pdf_from_storage.g.dart';

@Injectable()
class GetPDFFromStorage {
  final PDFRepository repository;

  GetPDFFromStorage(this.repository);

  Future<Either<Failure, File>> call() async {
    return await repository.getPDFFromStorage();
  }
}
