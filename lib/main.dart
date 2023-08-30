// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/material.dart';
import 'screen/Transferencia/lista.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.green[700],
                secondary: Colors.blueAccent[700],
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent[700])))),
      home: ListaTransferencias(),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

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
