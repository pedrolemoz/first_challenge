import 'package:first_challenge/app/modules/form/domain/usecases/upload_file_to_web.dart';
import 'package:first_challenge/app/modules/form/external/datasources/upload_datasource_implementation.dart';
import 'package:first_challenge/app/modules/form/infrastructure/repositories/upload_repository_implementation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_pdf_from_storage.dart';
import 'external/datasources/pdf_datasource_implementation.dart';
import 'infrastructure/repositories/pdf_repository_implementation.dart';
import 'presentation/controllers/form_bloc.dart';
import 'presentation/pages/form_page.dart';
import 'presentation/pages/success_page.dart';

class FormModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $FormBloc,
        $GetPDFFromStorage,
        $PDFRepositoryImplementation,
        $PDFDataSourceImplementation,
        $UploadFileToWeb,
        $UploadRepositoryImplementation,
        $UploadDataSourceImplementation,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => FormPage()),
        ModularRouter('/success', child: (_, args) => SuccessPage()),
      ];

  static Inject get to => Inject<FormModule>.of();
}
