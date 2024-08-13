import 'package:flutter/material.dart';
import 'package:flutter20240808/modelos/book.dart';
import 'package:flutter20240808/servicios/book_srv.dart';
import 'package:flutter20240808/widgets/fila_book.dart';

class ListviewBook extends StatefulWidget {
  const ListviewBook({Key? key}) : super(key: key);

  @override
  _ListviewBookState createState() => _ListviewBookState();
}

class _ListviewBookState extends State<ListviewBook> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: BookSrv.obtenerListadoStream(),
        builder: (BuildContext contexto, AsyncSnapshot<List<Book>> snap) {
          if(snap.hasData) {
            return ListView.builder(
                itemBuilder:
                (BuildContext contexto, int fila) {
              return FilaBook(snap.data![fila]);
            },
              itemCount: snap.data!.length,

            );
          }
          return Container();
    });
  }
}
