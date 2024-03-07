import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

//Creamos un mapa de productos con las claves nombre, descripcion y precio
final Map<String, Map<dynamic, dynamic>> productos = {
  'Portatil': {
    'Descripcion': 'Dice ser una maquina muy potente para programar',
    'Precio': 10000
  },
  'Lechuga': {'Descripcion': 'Verdura muy rica', 'Precio': 20000},
  'Manzana': {'Descripcion': 'Apple', 'Precio': 30000},
  'Crema de peinar': {'Descripcion': 'sedal rizos obedientes', 'Precio': 40000},
  'Ron Caldas': {'Descripcion': 'Producto 5', 'Precio': 50000},
  'Producto 6': {'Descripcion': 'Producto 6', 'Precio': 60000},
  'Producto 7': {'Descripcion': 'Producto 7', 'Precio': 70000},
  'Producto 8': {'Descripcion': 'Producto 8', 'Precio': 80000},
  'Producto 9': {'Descripcion': 'Producto 9', 'Precio': 90000},
  'Producto 10': {'Descripcion': 'Producto 10', 'Precio': 100000},
};

double precioenDolares = 0;

class _ProductosScreenState extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          precioenDolares =
              productos[productos.keys.elementAt(index)]?['Precio'] / 3500;
          precioenDolares = precioenDolares.roundToDouble();
          return ListTile(
            title: Text(productos.keys.elementAt(index)),
            subtitle: Text(
                'Descripcion: ${productos[productos.keys.elementAt(index)]?['Descripcion']} \nPrecio: ${productos[productos.keys.elementAt(index)]?['Precio']}\nPrecio en dolares: $precioenDolares'),
            leading: const Icon(
              Icons.shopping_cart,
              size: 25,
              color: Colors.blueAccent,
            ),
          );
        },
      ),
    );
  }
}
