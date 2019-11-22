import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormularioControleMensal extends StatefulWidget {
  FormularioControleMensal({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioControleMensalState();
  }
}

class FormularioControleMensalState extends State<FormularioControleMensal> {
  final _formKey = GlobalKey<FormState>();

  double _aInvestir = 0;

  final TextEditingController entradaController = new TextEditingController();

  List<String> _meses = <String>[
    '',
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];
  String _mes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: new Text(widget.title),
          ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      labelText: 'Mês',
                    ),
                    isEmpty: _mes == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _mes,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            //newContact.favoriteColor = newValue;
                            _mes = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: _meses.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Entrada',
                ),
                validator: _calculaMinimoInvestido,
                controller: entradaController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Investido',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
              ),
              new Text('Mínimo a ser investido = $_aInvestir'),
              Container(
                  padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                  child: RaisedButton(
                    child: const Text('Submit'),
                    onPressed: null,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  String _calculaMinimoInvestido(String entrada) {
    print('$entrada');
    final double entradaParse = double.tryParse(entrada);
    _aInvestir = entradaParse * 0.30;
    return null;
  }
}
