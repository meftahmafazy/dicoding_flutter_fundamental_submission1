import 'package:flutter/material.dart';
import 'package:restaurant1_app/Restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  final Restaurant restaurant;

  DetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Restaurant'),
          backgroundColor: Color(0XFF00CCCC),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(restaurant.pictureId),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          restaurant.city,
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
                        Text(
                          'Rating : ' + restaurant.rating.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0XFF8C8282),
                      thickness: 5,
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      'Deskripsi',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Text(
                      restaurant.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(
                      color: Color(0XFF8C8282),
                      thickness: 5,
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: restaurant.menus.foods.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              '- ' + restaurant.menus.foods[index].name,
                              style: TextStyle(fontSize: 18),
                            );
                          },
                        )),
                        Expanded(
                            child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          shrinkWrap: true,
                          itemCount: restaurant.menus.drinks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              '- ' + restaurant.menus.drinks[index].name,
                              style: TextStyle(fontSize: 18),
                            );
                          },
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
