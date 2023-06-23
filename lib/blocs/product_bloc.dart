import 'dart:async';

import 'package:bloc_sample/data/product_service.dart';

import '../models/product.dart';

class ProductBloc {
  final _productStreamController = StreamController.broadcast();

  Stream get getStream => _productStreamController.stream;

  List<Product> getAll() {
    return ProductService.getAll();
  }

}

final productBloc = ProductBloc();