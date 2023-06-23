import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Alışveriş")),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context,AsyncSnapshot snapshot) {
          return snapshot.data.length > 0
              ? buildProductListItems(snapshot)
              : const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final products = snapshot.data;
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].price.toString()),
            trailing: IconButton(
                onPressed: () => cartBloc.addToCart(CartItem(products[index], 1)),
                icon: const Icon(Icons.add_shopping_cart)),
          );
        });
  }
}
