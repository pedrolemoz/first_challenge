import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/form_bloc.dart';
import '../widgets/custom_button.dart';

class SuccessPage extends StatelessWidget {
  final formController = Modular.get<FormBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sucesso!')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dados salvos com sucesso',
                  style: Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 16),
              CustomButton(
                label: 'Cadastrar novamente',
                onPressed: () {
                  formController.resetForm();
                  Modular.navigator.pushReplacementNamed('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
