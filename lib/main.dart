import 'package:flutter/material.dart';
import 'package:restaurant1_app/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {HomePage.routeName: (Context) => HomePage()},
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
                          child: Column(
                        children: [_buildRestoItem(context, restaurant[index])],
                      ));
                    });
                // } else {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
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
      subtitle: Column(),
    );
  }
}
