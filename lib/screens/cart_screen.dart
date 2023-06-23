import 'package:flutter/material.dart';

import '../blocs/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sepetim")),
      ),
      body: buildCart(),
    );
  }

  buildCart() {
    return StreamBuilder(
      initialData: cartBloc.getCart(),
      stream: cartBloc.getStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.data.length > 0
            ? buildCartItems(snapshot)
            : const Center(
                child: Text("Sepetinizde Ürün Bulunamadı!"),
              );
      },
    );
  }

  buildCartItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final cart = snapshot.data;
          return ListTile(
            title: Text(cart[index].product.name),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              onPressed: () => cartBloc.removeFromCart(cart[index]),
              icon: const Icon(Icons.remove_shopping_cart_outlined),
            ),
          );
        });
  }
}
