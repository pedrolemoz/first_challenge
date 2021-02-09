import 'dart:io';

abstract class PDFDataSource {
  Future<File> getPDFFromStorage();
}
