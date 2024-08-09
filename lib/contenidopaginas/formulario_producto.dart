import 'package:flutter/material.dart';
import 'package:flutter20240808/servicios/producto_srv.dart';

import '../modelos/producto.dart';

class FormularioProducto extends StatefulWidget {
  const FormularioProducto({Key? key}) : super(key: key);

  @override
  _FormularioProductoState createState() => _FormularioProductoState();
}

class _FormularioProductoState extends State<FormularioProducto> {
  Producto producto =
      Producto(idProduct: 0, name: "", idProductCategory: 0, price: "");
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
    nameCtrl.text = producto.name ?? "";
    nameCtrl.addListener(() {
      producto.name = nameCtrl.text;
    });
    idProdCatCtrl.text = producto.idProductCategory.toString();
    idProdCatCtrl.addListener(() {
      if(idProdCatCtrl.text!="") {
        producto.idProductCategory = int.parse(idProdCatCtrl.text);
      } else {
        producto.idProductCategory=0;
      }
    });
    priceCtrl.text = producto.price ?? "";
    priceCtrl.addListener(() {
      producto.price = priceCtrl.text;
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
                var resultado = await ProductoSrv.insertarAsync(producto);
                //print(resultado);
                Navigator.pop(context);
              },
              child: Text("Agregar"))
        ],
      ),
    );
  }
}
