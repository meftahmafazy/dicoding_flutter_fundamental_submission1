import 'package:flutter/material.dart';
import 'package:restaurant1_app/Restaurant.dart';
import 'package:restaurant1_app/detail_page.dart';
import 'package:restaurant1_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomePage.routeName: (context) => HomePage(),
        DetailPage.routeName: (context) => DetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant App'),
          backgroundColor: Color(0XFF00CCCC),
        ),
        body: Container(
          child: FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                // if (snapshot.hasData) {
                final List<Restaurant> restaurant =
                    parseRestaurants(snapshot.data);
                return ListView.builder(
                    itemCount: restaurant.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Column(children: [
                        _buildRestoItem(context, restaurant[index]),
                      ]));
                    });
              }),
        ));
  }

  Widget _buildRestoItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          restaurant.pictureId,
          width: 100,
        ),
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              Text(
                restaurant.city,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          Row(
            children: [Text(restaurant.rating.toString())],
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant);
      },
    );
  }
}
