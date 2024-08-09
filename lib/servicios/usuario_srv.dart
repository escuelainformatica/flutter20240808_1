import 'package:flutter20240808/modelos/usuario.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UsuarioSrv {
  static var usuario = Usuario(); // es unico para toda la aplicacion (singleton)

  static Future<Usuario> obtenerAsync(String nombre) async {
    Usuario resultado = Usuario();
    //https://seg.cl/api/Product/insert (POST)
    var url = Uri.https('seg.cl', '/api/User/get/${nombre}', {});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      resultado = Usuario.fromJson(jsonResponse);
    } else {
      throw Exception("error");
    }
    return resultado;
  }
}
