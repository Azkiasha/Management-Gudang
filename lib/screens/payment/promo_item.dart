import 'package:gudang/app_properties.dart';
import 'package:gudang/models/product.dart';
import 'package:gudang/screens/product/components/color_list.dart';
import 'package:gudang/screens/product/components/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:gudang/fetch_data.dart';

class PromoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: Repository().fetchDataPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Product> products = snapshot.data ?? [];
          Product promoProduct = products.isNotEmpty
              ? products[0]
              : Product(
                  image: 'assets/headphones.png',
                  name: 'Boat roackerz 400 On-Ear Bluetooth Headphones',
                  description: 'description',
                  price: 45.3,
                );

          return Container(
            margin: EdgeInsets.only(top: 20),
            height: 280,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0, 0.8),
                  child: Container(
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadow,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 12.0, right: 12.0),
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    promoProduct.name,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: darkGrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 32.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        ColorOption(Colors.red),
                                        Text(
                                          '\Rp${promoProduct.price.toStringAsFixed(2)}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: darkGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 32.0,
                            bottom: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text('Use Promo Code'),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.grey[200],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Promo Code',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  child: ShopProductDisplay(
                    promoProduct,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
