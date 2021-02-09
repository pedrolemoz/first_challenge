import 'dart:convert';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../../infrastructure/datasources/upload_datasource.dart';

part 'upload_datasource_implementation.g.dart';

@Injectable()
class UploadDataSourceImplementation implements UploadDataSource {
  @override
  Future<void> uploadFileToWeb(File file) async {
    final url = 'api.example.com/upload_file';

    var bytes = await file.readAsBytes();
    final fileInBase64 = base64.encode(bytes);

    await http
        .post(url, body: {
          "file": fileInBase64,
          "name": file.path.split("/").last,
        })
        .then((res) => print(res.statusCode))
        .catchError((err) => print(err));
  }
}
