import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/listview_productos.dart';
import 'package:flutter20240808/modelos/producto.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';
import 'package:flutter20240808/widgets/barra_superior.dart';
import 'package:flutter20240808/widgets/menu_lateral.dart';

class PaginaProductoListar extends StatefulWidget {
  const PaginaProductoListar({Key? key}) : super(key: key);

  @override
  _PaginaProductoListarState createState() => _PaginaProductoListarState();
}

class _PaginaProductoListarState extends State<PaginaProductoListar> {
  List<Producto> productos=[];
  StreamController<List<Producto>> _currentUserStreamCtrl = StreamController<List<Producto>>.broadcast();
  Stream<List<Producto>> get onCurrentUserChanged => _currentUserStreamCtrl.stream;
  void refrescar() async {
    productos=await ProductoSrv.obtenerListadoAsync();
    _currentUserStreamCtrl.sink.add(productos);
  }

  @override
  Widget build(BuildContext context) {
    //var cuerpo=ListviewProductos();
    //cuerpo.
    return Scaffold(
      appBar: BarraSuperior(),
      body:ListviewProductos(productos,_currentUserStreamCtrl,onCurrentUserChanged,refrescar),
      drawer: MenuLateral(refrescar: refrescar,)
    );
  }
}
