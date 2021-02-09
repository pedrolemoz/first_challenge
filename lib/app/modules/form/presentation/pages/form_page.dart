import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/form_bloc.dart';
import '../widgets/bottom_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class FormPage extends StatelessWidget {
  final formController = Modular.get<FormBloc>();

  @override
  Widget build(BuildContext context) {
    final _items = ['Masculino', 'Feminino'];

    return Listener(
      onPointerDown: (_) {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Form')),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                      onChanged: formController.setName, label: 'Nome'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Selecione o sexo:',
                          style: Theme.of(context).textTheme.subtitle1),
                      StreamBuilder<Object>(
                        stream: formController.genderStream.stream,
                        builder: (context, snapshot) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: formController.gender,
                              onChanged: formController.setGender,
                              items: _items.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                      child: Text(value), value: value);
                                },
                              ).toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  StreamBuilder<Object>(
                    stream: formController.portalStream.stream,
                    builder: (context, snapshot) {
                      return CheckboxListTile(
                        onChanged: formController.togglePortal,
                        contentPadding: EdgeInsets.zero,
                        value: formController.usesPortal,
                        title: Text('Usa o portal?'),
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: formController.genderStream.stream,
                    builder:
                        (BuildContext context, AsyncSnapshot genderSnapshot) {
                      return StreamBuilder<String>(
                        stream: formController.reservistStream.stream,
                        builder: (context, snapshot) {
                          return formController.gender == 'Masculino'
                              ? Column(
                                  children: [
                                    CustomTextField(
                                      label: 'Nº de reservista',
                                      onChanged: formController.setReservist,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                )
                              : Container();
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder<Object>(
                        stream: formController.fileStream.stream,
                        builder: (context, snapshot) {
                          return Flexible(
                            child: Text(
                                formController.fileName == ''
                                    ? 'Selecione um arquivo'
                                    : formController.fileName,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1),
                          );
                        },
                      ),
                      CustomButton(
                        onPressed: formController.getPDF,
                        label: 'Carregar PDF',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder<Object>(
              stream: formController.messageStream.stream,
              builder: (context, snapshot) {
                return BottomButton(
                  label: formController.message,
                  onTap: formController.message == 'Continuar'
                      ? () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(width: 20),
                                      Text('Salvando dados'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          Future.delayed(
                            Duration(seconds: 2),
                            () => Modular.navigator.maybePop().then(
                                  (_) => Modular.navigator
                                      .pushReplacementNamed('/success'),
                                ),
                          );
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
