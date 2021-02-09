import 'dart:async';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecases/get_pdf_from_storage.dart';
import '../../domain/usecases/upload_file_to_web.dart';

part 'form_bloc.g.dart';

@Injectable()
class FormBloc extends Disposable {
  GetPDFFromStorage pdfFromStorage;
  UploadFileToWeb uploadFileToWeb;

  FormBloc(
    this.pdfFromStorage,
    this.uploadFileToWeb,
  );

  var name = '';
  var gender = 'Masculino';
  var reservist = '';
  var usesPortal = false;
  var message = 'Adicione o nome para continuar';
  var fileName = '';
  File file;

  final fileStream = BehaviorSubject<String>();
  final messageStream = BehaviorSubject<String>();
  final nameStream = BehaviorSubject<String>();
  final genderStream = BehaviorSubject<String>();
  final reservistStream = BehaviorSubject<String>();
  final portalStream = BehaviorSubject<bool>();

  void setName(String newName) {
    name = newName;
    nameStream.sink.add(name);
    _getMessage();
  }

  void setGender(String newGender) {
    gender = newGender;
    genderStream.sink.add(gender);
    _getMessage();
  }

  void setReservist(String newReservist) {
    reservist = newReservist;
    reservistStream.sink.add(reservist);
    _getMessage();
  }

  void togglePortal(bool newState) {
    usesPortal = newState;
    portalStream.sink.add(usesPortal);
    _getMessage();
  }

  Future<void> getPDF() async {
    final pdf = await pdfFromStorage();

    pdf.fold((error) => print(error), (file) async {
      file = file;

      fileName = file.path.split('/').last;

      fileStream.sink.add(fileName);

      _getMessage();
    });
  }

  Future<void> upload() async {
    await uploadFileToWeb(file: file);
  }

  void resetForm() {
    name = '';
    gender = 'Masculino';
    reservist = '';
    usesPortal = false;
    message = 'Adicione o nome para continuar';
    fileName = '';
    file = null;
  }

  void _getMessage() {
    message = name == ''
        ? 'Adicione um nome para continuar'
        : reservist == '' && gender == 'Masculino'
            ? 'Adicione o nº da reservista para continuar'
            : fileName == ''
                ? 'Selecione um arquivo para continuar'
                : 'Continuar';

    messageStream.sink.add(message);
  }

  @override
  void dispose() {
    nameStream.close();
    genderStream.close();
    reservistStream.close();
    portalStream.close();
    messageStream.close();
    fileStream.close();
  }
}
