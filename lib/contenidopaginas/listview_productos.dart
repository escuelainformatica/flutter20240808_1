import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter20240808/modelos/producto.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';
import 'package:flutter20240808/widgets/fila_producto.dart';

class ListviewProductos extends StatefulWidget {
  List<Producto> productos;
  StreamController<List<Producto>> currentUserStreamCtrl;
  Stream<List<Producto>> onCurrentUserChanged;
  void Function() refrescar;

  ListviewProductos(this.productos,this.currentUserStreamCtrl,this.onCurrentUserChanged,this.refrescar, {Key? key})
      : super(key: key);

  @override
  _ListviewProductosState createState() => _ListviewProductosState();
}

class _ListviewProductosState extends State<ListviewProductos> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.refrescar();
  }




  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.onCurrentUserChanged,
        builder:
            (BuildContext contexto, AsyncSnapshot<List<Producto>> snapshot) {
          if(
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return FilaProducto(snapshot.data![index],widget.refrescar); // ! prometo que tengo datos
              },

            );
          } else {
            return Text("cargando...");
          }
        }
    );
  }
}
