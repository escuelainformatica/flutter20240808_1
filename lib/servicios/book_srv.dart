import 'package:flutter20240808/modelos/book.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class BookSrv {

  static Stream<List<Book>> obtenerListadoStream() async* {
    List<Book> resultado=[];
    //https://seg.cl/api/Product/listall (GET)
    var url = Uri.https('seg.cl', '/api/Book/listall', {});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      resultado=jsonResponse.map((prod)=>Book.fromJson(prod)).toList();
    } else {
      throw Exception("error");
    }
    yield resultado;
  }
  static Future<int> insertarAsync(Book prod) async {
    int resultado=0;
    //https://seg.cl/api/Product/insert (POST)
    var url = Uri.https('seg.cl', '/api/Book/insert', {});
    var body=convert.jsonEncode(prod.toJson()); // producto -> map -> String

    var response = await http.post(url,body: body);
    if (response.statusCode == 200) {
      resultado=int.parse(response.body);
    } else {
      throw Exception("error");
    }
    return resultado;
  }

}