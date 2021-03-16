import 'package:cart/model/products_model.dart';
import 'package:flutter/material.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _baskets = [];

  Product _activeParoduct;

  MyStore() {
    _products = [
      Product(
          id: 1,
          qty: 1,
          name: "Mango",
          price: 40,
          pic:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZnfyRRKGr7CgFa_BPGk3PORlqLQ3ZoT8Q8lyE4iSCS6Cw4iSXbDyKZsyPNTE9WYOjXX4&usqp=CAU"),
      Product(
          id: 2,
          qty: 1,
          name: "Apple",
          price: 30,
          pic:
              "https://lh3.googleusercontent.com/proxy/cxKbfPJoyX4XN4o6z2akTlDydFRHnE7Lf3vuleqt6IL-y-6GQi-GFyxDpiCgQBpUn2X621wF1onDG3JMGYB6X_auDW9UGeyIh5_Pr1785Ceio8OO"),
      Product(
          id: 3,
          qty: 1,
          name: "Pomegranate",
          price: 40,
          pic:
              "https://shetkariagromart.com/wp-content/uploads/2020/08/Pomo.jpg"),
      Product(
          id: 4,
          qty: 1,
          name: "Guava",
          price: 20,
          pic:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1YdpA5txMO_fxJvDq7XZHPayOrweAOddFFp4b_QsyRPxMOx3pQSEMR_OVlfKvLk7KbJo&usqp=CAU"),
      Product(
          id: 5,
          qty: 1,
          name: "Dragon Fruit",
          price: 60,
          pic:
              "https://media.naheed.pk/catalog/product/cache/49dcd5d85f0fa4d590e132d0368d8132/1/1/1168865-1.jpg"),
      Product(
          id: 6,
          qty: 1,
          name: "Beauty Pear",
          price: 50,
          pic:
              "https://st2.depositphotos.com/1043644/6985/i/950/depositphotos_69854361-stock-photo-beautiful-pear.jpg"),
      Product(
          id: 7,
          qty: 1,
          name: "Kiwi Fruit",
          price: 35,
          pic:
              "https://cdn.shopify.com/s/files/1/0065/1637/5588/products/KiwiFruit.png?v=1594818907"),
      Product(
          id: 8,
          qty: 1,
          name: "Strawberry",
          price: 20,
          pic:
              "https://media.istockphoto.com/photos/one-strawberry-on-white-background-picture-id164403228?k=6&m=164403228&s=170667a&w=0&h=8fz34Ohqmx0pW-c1aYGFRi-PRIPnQtA9nLf-MYhsSx0="),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;

  List<Product> get baskets => _baskets;

  Product get activeProduct => _activeParoduct;

  setActiveProduct(Product currentProduct) {
    _activeParoduct = currentProduct;
  }

  addOneItemToBasket(Product currentproduct) {
    Product found = _baskets.firstWhere(
        (element) => element.id == currentproduct.id,
        orElse: () => null);
    // Product found = _baskets.map((element)=> element.id==currentproduct.id);
    if (found != null) {
      found.qty += 1;
    } else {
      _baskets.add(currentproduct);
    }
    notifyListeners();
  }

  removeOneItemToBasket(Product currentproduct) {
    Product found = _baskets.firstWhere(
        (element) => element.id == currentproduct.id,
        orElse: () => null);
    if (found != null && found.qty == 1) {
      _baskets.remove(currentproduct);
    } else {
      found.qty -= 1;
    }
    notifyListeners();
  }

  getBasketQuantity() {
    int total = 0;
    for (int i = 0; i < baskets.length; i++) {
      total += baskets[i].qty;
    }
    return total;
  }
}
