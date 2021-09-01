import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicksell_android_app/pages/product_list_page.dart';
import 'package:quicksell_android_app/view%20models/product_list_view_model.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "products",
      
      home: ChangeNotifierProvider(
        create: (context) => ProductListViewModel(),
        child: ProductListPage(),
      ),
    );
  }
}
