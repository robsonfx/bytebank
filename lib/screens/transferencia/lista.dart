import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    // widget._transferencias.add(Transferencia(100.0, 5555));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferências",
        ),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferido = widget._transferencias[indice];
          return ItemTransferencia(transferido);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //cria rota no future para retornar um dado para atela de listagem
          // pelo context atraves de um calback.
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTransferencia();
          })).then((tranferenciaRecebida) {
            _atualiza(tranferenciaRecebida!);
          });
        },
      ),
    );
  }

  void _atualiza(Transferencia tranferenciaRecebida) {
    setState(() => widget._transferencias.add(tranferenciaRecebida));
  }
}

@immutable
class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia(this.transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        autofocus: true,
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}
