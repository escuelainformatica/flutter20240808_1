import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/formulario_producto.dart';

import '../widgets/barra_superior.dart';
import '../widgets/menu_lateral.dart';

class PaginaProductoInsertar extends StatefulWidget {
  const PaginaProductoInsertar({Key? key}) : super(key: key);

  @override
  _PaginaProductoInsertarState createState() => _PaginaProductoInsertarState();
}

class _PaginaProductoInsertarState extends State<PaginaProductoInsertar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BarraSuperior(),
        body:FormularioProducto(),
        drawer: MenuLateral()
    );
  }
}
