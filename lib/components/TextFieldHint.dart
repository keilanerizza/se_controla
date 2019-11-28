import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldHint extends StatelessWidget {
  final String nomeCampo;
  final String sugerido;

  const TextFieldHint({this.nomeCampo, this.sugerido});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: nomeCampo,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      sugerido,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
