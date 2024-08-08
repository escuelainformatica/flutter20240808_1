import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/listview_productos.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';
import 'package:flutter20240808/widgets/barra_superior.dart';
import 'package:flutter20240808/widgets/menu_lateral.dart';

class PaginaProductoListar extends StatefulWidget {
  const PaginaProductoListar({Key? key}) : super(key: key);

  @override
  _PaginaProductoListarState createState() => _PaginaProductoListarState();
}

class _PaginaProductoListarState extends State<PaginaProductoListar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraSuperior(),
      body:ListviewProductos(),
      drawer: MenuLateral()
    );
  }
}
