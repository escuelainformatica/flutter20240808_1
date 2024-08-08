import 'package:flutter/material.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';

import '../modelos/producto.dart';

class FormularioActualizarProducto extends StatefulWidget {
  Producto producto;
  FormularioActualizarProducto(this.producto, {Key? key}) : super(key: key);

  @override
  _FormularioActualizarProducto createState() => _FormularioActualizarProducto();
}

class _FormularioActualizarProducto extends State<FormularioActualizarProducto> {

  var nameCtrl = TextEditingController();
  var idProdCatCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

/*
    "Name": "prod-1",
    "IdProductCategory": 1,
    "Price": "100.00"

 */
  @override
  void initState() {
    super.initState();
    nameCtrl.text = widget.producto.name ?? "";
    nameCtrl.addListener(() {
      widget.producto.name = nameCtrl.text;
    });
    idProdCatCtrl.text = widget.producto.idProductCategory.toString();
    idProdCatCtrl.addListener(() {
      widget.producto.idProductCategory = int.parse(idProdCatCtrl.text);
    });
    priceCtrl.text = widget.producto.price ?? "";
    priceCtrl.addListener(() {
      widget.producto.price = priceCtrl.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nombre:"),
          TextField(
            controller: nameCtrl,
          ),
          Text("Id Categoria:"),
          TextField(
            controller: idProdCatCtrl,
          ),
          Text("Id Precio:"),
          TextField(
            controller: priceCtrl,
          ),
          Container(height: 20,),
          ElevatedButton(
              onPressed: () async {
                var resultado = await ProductoSrv.actualizarAsync(widget.producto);
                //print(resultado);
                Navigator.pop(context);
              },
              child: Text("Actualizar"))
        ],
      ),
    );
  }
}
