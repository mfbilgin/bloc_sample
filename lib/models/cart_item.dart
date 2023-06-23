import 'package:bloc_sample/models/product.dart';

class CartItem{
  late Product product;
  late int quantity;

  CartItem(this.product, this.quantity);
  
}