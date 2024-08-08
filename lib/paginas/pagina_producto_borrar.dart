import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/formulario_borrar_producto.dart';
import 'package:flutter20240808/contenidopaginas/formulario_producto.dart';
import 'package:flutter20240808/modelos/producto.dart';

import '../contenidopaginas/formulario_actualizar_producto.dart';
import '../widgets/barra_superior.dart';
import '../widgets/menu_lateral.dart';

class PaginaProductoBorrar extends StatefulWidget {
  Producto producto;
  PaginaProductoBorrar(this.producto, {Key? key}) : super(key: key);

  @override
  _PaginaProductoBorrar createState() => _PaginaProductoBorrar();
}

class _PaginaProductoBorrar extends State<PaginaProductoBorrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BarraSuperior(),
        body:FormularioBorrarProducto(widget.producto),
        drawer: MenuLateral()
    );
  }
}
