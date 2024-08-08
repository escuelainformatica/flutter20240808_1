import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/formulario_producto.dart';
import 'package:flutter20240808/modelos/producto.dart';

import '../contenidopaginas/formulario_actualizar_producto.dart';
import '../widgets/barra_superior.dart';
import '../widgets/menu_lateral.dart';

class PaginaProductoActualiza extends StatefulWidget {
  Producto producto;
  PaginaProductoActualiza(this.producto, {Key? key}) : super(key: key);

  @override
  _PaginaProductoActualiza createState() => _PaginaProductoActualiza();
}

class _PaginaProductoActualiza extends State<PaginaProductoActualiza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BarraSuperior(),
        body:FormularioActualizarProducto(widget.producto),
        drawer: MenuLateral()
    );
  }
}
