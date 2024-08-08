import 'package:flutter/material.dart';
import 'package:flutter20240808/paginas/pagina_producto_insertar.dart';
import 'package:flutter20240808/paginas/pagina_producto_listar.dart';
import 'package:flutter20240808/widgets/fila_producto.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Listar Productos'),
            selected: _selectedIndex == 0,
            onTap: () async {
              // Update the state of the app
              //_onItemTapped(0);
              await Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaProductoListar(),));
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Ingresar Producto'),
            selected: _selectedIndex == 1,
            onTap: () async {
              // Update the state of the app
              //_onItemTapped(1);
              await Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaProductoInsertar(),));
              // Then close the drawer
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
