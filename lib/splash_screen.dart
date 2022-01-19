import 'package:flutter/material.dart';
import 'package:restaurant1_app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Image.network(
              'https://www.pngkey.com/png/detail/596-5961726_nyc-winter-restaurant-week-begins-january-rd-nyc.png'),
        ),
        Text(
          'RestaurantKu',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          'by Muhammad Meftah Mafazy',
          style: TextStyle(fontSize: 18),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0XFF00CCCC), textStyle: TextStyle(fontSize: 18)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Next'))
      ],
    ));
  }
}
