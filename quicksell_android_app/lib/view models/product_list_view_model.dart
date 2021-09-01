import 'package:flutter/material.dart';
import 'package:quicksell_android_app/services/webservice.dart';

class ProductListViewModel extends ChangeNotifier {
  List<String> productList = <String>[];
  bool loading = true;

  Future<void> fetchProducts() async {
    this.productList = await WebService().fetchProductsList();
    // DatabaseMethods().getProductNameById(productList[0]);
    loading = false;

    notifyListeners();
  }
}
