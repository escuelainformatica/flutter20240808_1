import 'package:flutter/material.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';

import '../modelos/producto.dart';

class FormularioBorrarProducto extends StatefulWidget {
  Producto producto;
  FormularioBorrarProducto(this.producto, {Key? key}) : super(key: key);

  @override
  _FormularioBorrarProducto createState() => _FormularioBorrarProducto();
}

class _FormularioBorrarProducto extends State<FormularioBorrarProducto> {

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
                var resultado = await ProductoSrv.borrarAsync(widget.producto.idProduct??0);
                //print(resultado);
                Navigator.pop(context);
              },
              child: Text("Borrar"))
        ],
      ),
    );
  }
}
