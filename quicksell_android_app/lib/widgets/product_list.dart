import 'package:flutter/material.dart';
import 'package:quicksell_android_app/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  final List<String>? productList;
  final bool? loading;

  ProductList({this.productList, this.loading});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading == true) {
      return Center(child: CircularProgressIndicator());
    } else {
      return FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              return ListView.builder(
                itemCount: this.widget.productList!.length,
                itemBuilder: (context, index) {
                  final int count = widget.productList!.length > 10
                      ? 10
                      : widget.productList!.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController!.forward();
                  return AnimatedBuilder(
                      animation: animationController!,
                      builder: (BuildContext context, Widget? child) {
                        return FadeTransition(
                          opacity: animation,
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0.0, 50 * (1.0 - animation.value), 0.0),
                            child: ProductCard(id: widget.productList![index]),
                          ),
                        );
                      });
                },
              );
            }
          });
    }
  }
}
