import 'package:gudang/app_properties.dart';
import 'package:gudang/models/product.dart';
import 'package:gudang/screens/product/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:gudang/fetch_data.dart';

class MoreProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      // Gunakan FutureBuilder untuk menangani hasil asynchronous dari fetchDataPlaces
      future: Repository().fetchDataPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Tampilkan widget loading jika data masih dimuat
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Tampilkan pesan error jika terjadi kesalahan
          return Text('Error: ${snapshot.error}');
        } else {
          // Tampilkan widget MoreProducts setelah mendapatkan data
          List<Product> products = snapshot.data ?? [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
                child: Text(
                  'More products',
                  style: TextStyle(color: Colors.white, shadows: shadow),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                height: 250,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      /// calculates the left and right margins
                      /// to be even with the screen margin
                      padding: index == 0
                          ? EdgeInsets.only(left: 24.0, right: 8.0)
                          : index == 4
                              ? EdgeInsets.only(right: 24.0, left: 8.0)
                              : EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductCard(products[index]),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
