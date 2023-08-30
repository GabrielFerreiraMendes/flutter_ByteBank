// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, use_key_in_widget_constructors

import 'package:bytebank/main.dart';
import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Tranferência';
const _rotuloCampoConta = 'Número da conta';
const _dicaCampoConta = '0000';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final _controladorCampoNumeroConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                texto: _rotuloCampoConta,
                dica: _dicaCampoConta),
            Editor(
                controlador: _controladorCampoValor,
                texto: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textBotaoConfirmar))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);

    if (valor != null && numeroConta != null) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, novaTransferencia);
    }
  }
}
