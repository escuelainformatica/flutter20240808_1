import 'package:flutter/material.dart';
import 'package:flutter20240808/servicios/usuario_srv.dart';

class BarraSuperior extends AppBar {

   BarraSuperior({Key? key}) : super(key: key);

  @override
  _BarraSuperiorState createState() => _BarraSuperiorState();
}

class _BarraSuperiorState extends State<BarraSuperior> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("listar productos"),
      actions: [
        Text(UsuarioSrv.usuario.userName??"(no hay usuario)")
      ],
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}
