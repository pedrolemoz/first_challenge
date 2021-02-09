import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/exceptions.dart';
import '../../infrastructure/datasources/pdf_datasource.dart';

part 'pdf_datasource_implementation.g.dart';

@Injectable()
class PDFDataSourceImplementation implements PDFDataSource {
  @override
  Future<File> getPDFFromStorage() async {
    try {
      FilePickerResult result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

      if (result != null) {
        var file = File(result.files.single.path);

        return file;
      }
    } on Exception {
      throw PDFException();
    }
  }
}
