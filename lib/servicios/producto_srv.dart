import 'package:flutter20240808/servicios/usuario_srv.dart';

import '../modelos/producto.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class ProductoSrv {
  static Future<List<Producto>> obtenerListadoAsync() async {
    List<Producto> resultado=[];
    //https://seg.cl/api/Product/listall (GET)
    var url = Uri.https('seg.cl', '/api/Product/listall', {});
    Map<String,String> encabezado={
      "Authorization":"Bearer ${UsuarioSrv.usuario.userName}" // aqui deberia ir el token
    };
    var response = await http.get(url,headers: encabezado);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      resultado=jsonResponse.map((prod)=>Producto.fromJson(prod)).toList();
    } else {
      throw Exception("error");
    }
    return resultado;
  }
  static Stream<List<Producto>> obtenerListadoStream() async* {
    List<Producto> resultado=[];
    //https://seg.cl/api/Product/listall (GET)
    var url = Uri.https('seg.cl', '/api/Product/listall', {});
    Map<String,String> encabezado={
      "Authorization":"Bearer ${UsuarioSrv.usuario.userName}" // aqui deberia ir el token
    };
    var response = await http.get(url,headers: encabezado);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      resultado=jsonResponse.map((prod)=>Producto.fromJson(prod)).toList();
    } else {
      throw Exception("error");
    }
    yield resultado;
  }
  static Future<int> insertarAsync(Producto prod) async {
    int resultado=0;
    //https://seg.cl/api/Product/insert (POST)
    var url = Uri.https('seg.cl', '/api/Product/insert', {});
    var body=convert.jsonEncode(prod.toJson()); // producto -> map -> String
    Map<String,String> encabezado={
      "Authorization":"Bearer ${UsuarioSrv.usuario.userName}" // aqui deberia ir el token
    };
    var response = await http.post(url,body: body,headers: encabezado);
    if (response.statusCode == 200) {
      resultado=int.parse(response.body);
    } else {
      throw Exception("error");
    }
    return resultado;
  }
  static Future<int> actualizarAsync(Producto prod) async {
    int resultado=-1;
    //https://seg.cl/api/Product/insert (POST)
    var url = Uri.https('seg.cl', '/api/Product/update', {});
    Map<String,String> encabezado={
      "Authorization":"Bearer ${UsuarioSrv.usuario.userName}" // aqui deberia ir el token
    };
    var body=convert.jsonEncode(prod.toJson()); // producto -> map -> String
    var response = await http.post(url,body: body,headers: encabezado);
    if (response.statusCode == 200) {
      resultado=int.parse(response.body);
    } else {
      throw Exception("error");
    }
    return resultado;
  }
  static Future<int> borrarAsync(int idProducto) async {
    int resultado=-1;
    //https://seg.cl/api/Product/insert (POST)
    var url = Uri.https('seg.cl', '/api/Product/delete/$idProducto', {});
    Map<String,String> encabezado={
      "Authorization":"Bearer ${UsuarioSrv.usuario.userName}" // aqui deberia ir el token
    };
    var response = await http.get(url,headers: encabezado);
    if (response.statusCode == 200) {
      resultado=int.parse(response.body);
    } else {
      throw Exception("error");
    }
    return resultado;
  }

}