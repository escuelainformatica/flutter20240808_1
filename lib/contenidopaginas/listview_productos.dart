import 'package:flutter/material.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';

import '../modelos/producto.dart';
import '../widgets/fila_producto.dart';

class ListviewProductos extends StatefulWidget {
  const ListviewProductos({Key? key}) : super(key: key);

  @override
  _ListviewProductosState createState() => _ListviewProductosState();
}

class _ListviewProductosState extends State<ListviewProductos> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ProductoSrv.obtenerListadoStream(),
        builder:
            (BuildContext contexto, AsyncSnapshot<List<Producto>> snapshot) {
                if(snapshot.connectionState==ConnectionState.done &&
                snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FilaProducto(snapshot.data![index]); // ! prometo que tengo datos
                    },

                  );
                } else {
                  return Text("cargando...");
                }
            }
        );
  }
}
