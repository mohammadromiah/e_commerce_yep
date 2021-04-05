import 'package:yep_flutter_project/const.dart';
import 'package:yep_flutter_project/api/api_manager.dart';
import 'package:yep_flutter_project/api/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product_grid_view.dart';

class ElectronicCategory extends StatefulWidget {
  @override
  _ElectronicCategoryState createState() => _ElectronicCategoryState();
}

class _ElectronicCategoryState extends State<ElectronicCategory> {

  Future<List<Product>> _products;
  @override
  void initState() {
    super.initState();

    _products = ApiManager().getProduct(Strings.electronicsCategoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: FutureBuilder(
        future: _products,
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            return ProductGridView(
              products: snapshot.data,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
