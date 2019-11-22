import 'package:flutter/material.dart';
import 'package:se_controla/screens/controle_mensal/formulario.dart';

void main() => runApp(SeControla());

/// This Widget is the main application widget.
class SeControla extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioControleMensal(),
      ),
    );
  }
}