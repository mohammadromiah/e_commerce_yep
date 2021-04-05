import 'package:flutter/material.dart';
import '../api/product.dart';
// class Cards extends StatefulWidget {
//   @override
//   _CardsState createState() => _CardsState();
// }
//
// class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child:
//
//             );
//   }
// }

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            height: 175,
            width: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: new DecorationImage(
                image: new NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.id.toString(),
              style: TextStyle(

                fontSize: 15,


              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '\$ ' + product.price.toString(),
              style: TextStyle(

                fontSize: 12,


              ),
            ),
          ),
        ],
      ),
    );
  }
}
