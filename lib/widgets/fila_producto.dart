import 'package:flutter/material.dart';
import 'package:flutter20240808/modelos/producto.dart';
import 'package:flutter20240808/paginas/pagina_producto_actualiza.dart';
import 'package:flutter20240808/paginas/pagina_producto_borrar.dart';

class FilaProducto extends StatefulWidget {
  Producto producto;
  void Function() refrescar;
  FilaProducto(this.producto,this.refrescar,{Key? key}) : super(key: key);

  @override
  _FilaProductoState createState() => _FilaProductoState();
}

class _FilaProductoState extends State<FilaProducto> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.producto.name??"sin nombre"),
        leading:
          ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaProductoActualiza(widget.producto),
                  )).then((valor) {
                setState(() {

                });
              });
            },
            child: Text("Actualizar"),
          ),
        trailing:
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaginaProductoBorrar(widget.producto),
                    )).then((valor) {
                      widget.refrescar();
                });
              },
              child: Text("Borrar"),
            )
          ,
      ),
    );
  }
}
