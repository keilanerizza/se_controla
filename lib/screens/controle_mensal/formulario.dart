import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:se_controla/components/TextFieldHint.dart';

class FormularioControleMensal extends StatefulWidget {
  FormularioControleMensal({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioControleMensalState();
  }
}

class FormularioControleMensalState extends State<FormularioControleMensal> {
  final _formKey = GlobalKey<FormState>();

  double _aInvestir;
  double _aInvestirEssencial;
  double _aInvestirEducacao;
  double _aInvestirExtra;

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
                controller: entradaController,
                keyboardType: TextInputType.number,
                onChanged: _calculaMinimoInvestido,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
              ),
              TextFieldHint(
                nomeCampo: 'Investido',
                sugerido: '$_aInvestir',
              ),
              TextFieldHint(
                nomeCampo: 'Essencial',
                sugerido: '$_aInvestirEssencial',
              ),
              TextFieldHint(
                nomeCampo: 'Educação',
                sugerido: '$_aInvestirEducacao',
              ),
              TextFieldHint(
                nomeCampo: 'Extra',
                sugerido: '$_aInvestirExtra',
              ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: RaisedButton(
                  child: const Text('Submit'),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _calculaMinimoInvestido(String entrada) {
    print('$entrada');
    if (entrada != null && entrada != '') {
      final double entradaParse = double.tryParse(entrada);

      setState(() {
        _aInvestir = (entradaParse * 0.30).roundToDouble();
        _aInvestirEssencial = (entradaParse * 0.55).roundToDouble();
        _aInvestirEducacao = (entradaParse * 0.05).roundToDouble();
        _aInvestirExtra = (entradaParse * 0.10).roundToDouble();

      });
    } else {
      _aInvestir = 0;
    }
    return '';
  }
}
