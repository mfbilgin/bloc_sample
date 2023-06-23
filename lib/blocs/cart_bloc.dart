import 'dart:async';

import 'package:bloc_sample/models/cart_item.dart';

import '../data/cart_service.dart';

class CartBloc{
  final cartStreamBuilder = StreamController.broadcast();

  Stream get getStream => cartStreamBuilder.stream;

  void addToCart(CartItem item){
    CartService.addToCart(item);
    cartStreamBuilder.sink.add(CartService.getCart());
  }

  void removeFromCart(CartItem item){
    CartService.removeFromCart(item);
    cartStreamBuilder.sink.add(CartService.getCart());
  }

  List getCart(){
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();