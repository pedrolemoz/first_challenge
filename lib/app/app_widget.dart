import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Form',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}