// import 'package:ecommerce_mobile_app/model/product_model.dart';
// import 'package:ecommerce_mobile_app/routes/details_route/details_screen.dart';
// import 'package:ecommerce_mobile_app/routes/products/product_item.dart';
import 'package:yep_flutter_project/api/product.dart';
import 'package:yep_flutter_project/screens/ProductPage.dart';
import 'cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  final List<Product> products;

  ProductGridView({this.products});

  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.73,
          crossAxisCount: 2,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 5),
      itemBuilder: (context, index) => GestureDetector(
        child: ProductItem(widget.products[index]),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductPage(
                product: widget.products[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
