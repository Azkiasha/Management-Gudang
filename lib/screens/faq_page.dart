import 'package:gudang/app_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Panel> panels = [
    Panel(
      'What products are available in our warehouse?',
      'Our warehouse offers a wide range of products, including electronics, hardware, machinery, clothing, and more. You can find almost anything you need for your business in our warehouse.',
      false,
    ),
    Panel(
      'How can I check the stock levels of a product?',
      'You can check the stock levels of a product by logging into your account and visiting the product details page. The product details will display the current stock availability.',
      false,
    ),
    Panel(
      'Can I request a special order or custom product?',
      'Yes, we offer the option for special orders and custom products. Contact our customer support for more information on how to place a special order or request a custom product.',
      false,
    ),
    Panel(
      'What are the shipping options available?',
      'We offer various shipping options, including standard shipping, express shipping, and international shipping. You can choose the shipping method that best suits your needs during the checkout process.',
      false,
    ),
    Panel(
      'How can I track my order?',
      'After placing an order, you will receive a tracking number. You can use this tracking number to monitor the status and location of your order. We also provide order tracking through our website.',
      false,
    ),
    Panel(
      'What is the return policy?',
      'Our return policy allows for returns within 30 days of the purchase date. If you are not satisfied with your order, you can request a return or exchange. Please review our return policy for more details.',
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'FAQ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 16.0,
                ),
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              ...panels
                  .map(
                    (panel) => ExpansionTile(
                      title: Text(
                        panel.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          color: Color(0xffFAF1E2),
                          child: Text(
                            panel.content,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class Panel {
  String title;
  String content;
  bool expanded;

  Panel(this.title, this.content, this.expanded);
}
