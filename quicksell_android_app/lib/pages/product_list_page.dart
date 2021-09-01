import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicksell_android_app/view%20models/product_list_view_model.dart';
import 'package:quicksell_android_app/widgets/product_list.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductListViewModel>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductListViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: Text("products"),backgroundColor: Colors.grey,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ProductList(productList: vm.productList, loading: vm.loading,),
      ),
    );
  }
}
