import 'package:flutter/material.dart';
import 'package:gudang/screens/main/main_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  List<Map<String, String>> introData = [
    {
      'image': 'assets/firstScreen.png',
      'title': 'Welcome to our Warehouse',
      'description':
          'Explore a wide range of products and find everything you need for your business.',
    },
    {
      'image': 'assets/secondScreen.png',
      'title': 'Efficient Inventory Management',
      'description':
          'Manage your inventory with ease and keep track of your stock levels in real-time.',
    },
    {
      'image': 'assets/thirdScreen.png',
      'title': 'Fast and Reliable Shipping',
      'description':
          'We guarantee fast and reliable shipping services to deliver your goods on time.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          image: DecorationImage(image: AssetImage('assets/background.png')),
        ),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: controller,
              itemCount: introData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        introData[index]['image']!,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        introData[index]['title']!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16.0,
                      ),
                      child: Text(
                        introData[index]['description']!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 16.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 0 ? Colors.amber : Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 1 ? Colors.amber : Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 2 ? Colors.amber : Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Opacity(
                          opacity: pageIndex != 2 ? 1.0 : 0.0,
                          child: TextButton(
                            child: Text(
                              'SKIP',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            },
                          ),
                        ),
                        pageIndex != 2
                            ? TextButton(
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  if (!(controller.page == 2.0))
                                    controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.linear,
                                    );
                                },
                              )
                            : TextButton(
                                child: Text(
                                  'FINISH',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()));
                                },
                              )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
