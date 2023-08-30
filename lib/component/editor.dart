import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String texto;
  final String dica;
  final IconData? icone;

  Editor(
      {super.key,
      required this.controlador,
      required this.texto,
      required this.dica,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: texto,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
