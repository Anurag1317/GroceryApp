import 'package:bookstore/constants.dart';
import 'package:bookstore/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'horizontal_listview.dart';

class HomeScreen extends StatefulWidget {
  static String routename = "Homescreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget imagecarousel = new Container(
        height: 200.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/images/carousel1.jpg'),
            AssetImage('assets/images/carousel2.jpg'),
            AssetImage('assets/images/carousel3.jpg'),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          dotColor: kiconColor,
          indicatorBgPadding: 5.0,
        ));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: kprimaryColor,
          title: Text(
            'GoodHealth',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('Anurag Prasad'),
                accountEmail: Text('anuragprasad1317@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: kprimaryColor),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Profile '),
                  leading: Icon(
                    Icons.person,
                    color: kiconColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Orders'),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: kiconColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Categories'),
                  leading: Icon(
                    Icons.dashboard,
                    color: kiconColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('favourites '),
                  leading: Icon(
                    Icons.favorite,
                    color: kiconColor,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(
                    Icons.help,
                    color: kiconColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(
                    Icons.settings,
                    color: kiconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            imagecarousel,
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Categories'),
            ),
            HorizontalList(),
            RecommendedBtn(
              title: 'Recommended',
            ),
            // Verticallist(),
          ],
        ),
      ),
    );
  }
}

class RecommendedBtn extends StatelessWidget {
  final String title;
  final String onpressed;
  const RecommendedBtn({Key key, this.title, this.onpressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Title(color: kprimaryColor, child: Text(title)),
          Spacer(),
          FlatButton(
            onPressed: () {},
            child: Text(
              'More',
              style: TextStyle(color: kprimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
