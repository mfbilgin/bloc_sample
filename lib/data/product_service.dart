import '../models/product.dart';

class ProductService{
  static final List<Product> products = [
    Product(1, "Acer Laptop", 20000),
    Product(2, "Asus Laptop", 30000),
    Product(3, "Hp Laptop", 40000),
    Product(4, "Lenovo Laptop", 50000),
    Product(5, "Macbook Laptop", 60000),
  ];

  static final ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }
  ProductService._internal();

  static List<Product> getAll(){
    return products;
  }
}