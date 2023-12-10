import 'package:gudang/app_properties.dart';
import 'package:gudang/models/product.dart';
import 'package:gudang/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:gudang/fetch_data.dart';

class RecommendedList extends StatelessWidget {
  final Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: repository.fetchDataPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          List<Product> products = snapshot.data!;
          return Column(
            children: <Widget>[
              SizedBox(
                height: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    IntrinsicHeight(
                      child: Container(
                        margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                        width: 4,
                        color: mediumYellow,
                      ),
                    ),
                    Center(
                        child: Text(
                      'Recommended',
                      style: TextStyle(
                          color: darkGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                  child: MasonryGridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    crossAxisCount: 4,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) =>
                        new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductPage(product: products[index]))),
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                  colors: [
                                    Colors.grey.withOpacity(0.3),
                                    Colors.grey.withOpacity(0.7),
                                  ],
                                  center: Alignment(0, 0),
                                  radius: 0.6,
                                  focal: Alignment(0, 0),
                                  focalRadius: 0.1),
                            ),
                            child: Hero(
                                tag: products[index].image,
                                child: Image.network(products[index].image))),
                      ),
                    ),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
