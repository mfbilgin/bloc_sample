import '../models/cart_item.dart';

class CartService{
  static final cartItems = <CartItem>[];

  static final CartService _singleton = CartService._internal();

  factory CartService(){
    return _singleton;
  }

  CartService._internal();

  static void addToCart(CartItem item){
    cartItems.add(item);
  }

  static void removeFromCart(CartItem item){
    cartItems.remove(item);
  }

  static List<CartItem> getCart(){
    return cartItems;
  }

}