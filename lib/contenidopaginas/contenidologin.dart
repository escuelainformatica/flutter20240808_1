import 'package:flutter/material.dart';
import 'package:flutter20240808/modelos/usuario.dart';
import 'package:flutter20240808/paginas/pagina_producto_listar.dart';
import 'package:flutter20240808/servicios/usuario_srv.dart';

class Contenidologin extends StatefulWidget {
  const Contenidologin({Key? key}) : super(key: key);

  @override
  _ContenidologinState createState() => _ContenidologinState();
}

class _ContenidologinState extends State<Contenidologin> {
  var usuario=Usuario();
  var usuarioCtl=TextEditingController();
  var claveCtl=TextEditingController();
  @override
  void initState() {

    super.initState();
    usuarioCtl.text=usuario.userName??"";
    usuarioCtl.addListener(() {
      usuario.userName=usuarioCtl.text;
    });
    claveCtl.text=usuario.password??"";
    claveCtl.addListener(() {
      usuario.password=claveCtl.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("Pagina de login"),
          TextField(controller: usuarioCtl,),
          TextField(controller: claveCtl,),
          ElevatedButton(onPressed: () async {
            var usuariodb=await UsuarioSrv.obtenerAsync(usuario.userName??"");
            if(usuariodb.userName==usuario.userName && usuariodb.password==usuario.password) {
              UsuarioSrv.usuario=usuariodb;
              // ok, el usuario esta listo
              await Navigator
                  .push(context, MaterialPageRoute(builder: (context) => PaginaProductoListar(),));
              ;
            }

          }, child: Text("Login"))
        ]
    );
  }
}
