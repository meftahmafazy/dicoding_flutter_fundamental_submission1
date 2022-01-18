import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  List<Restaurant> restaurants;

  Welcome({
    required this.restaurants,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
      restaurants:
          List<Restaurant>.from(json["restaurants"].map((x) => x.toJson())));

  Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menus menus;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus});

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'];
    menus = restaurant['menus'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
      };
}

class Menus {
  List<Food> foods;
  List<Drink> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
      foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Food {
  late String name;

  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> json) => Food(name: json["name"]);

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Drink {
  late String name;

  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(name: json["name"]);

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  print(jsonDecode(json)['restaurants']);
  final List<Restaurant> restaurants =
      Welcome.fromJson(jsonDecode(json)).restaurants;
  return restaurants;
}

// class Restaurant {
//   List<Restaurants>? restaurants;
//
//   Restaurant({this.restaurants});
//
//   Restaurant.fromJson(Map<String, dynamic> json) {
//     if (json['restaurants'] != null) {
//       restaurants = <Restaurants>[];
//       json['restaurants'].forEach((v) {
//         restaurants!.add(new Restaurants.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.restaurants != null) {
//       data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Restaurants {
//   String? id;
//   String? name;
//   String? description;
//   String? pictureId;
//   String? city;
//   double? rating;
//   Menus? menus;
//
//   Restaurants(
//       {this.id,
//       this.name,
//       this.description,
//       this.pictureId,
//       this.city,
//       this.rating,
//       this.menus});
//
//   Restaurants.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     pictureId = json['pictureId'];
//     city = json['city'];
//     rating = json['rating'];
//     menus = json['menus'] != null ? new Menus.fromJson(json['menus']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['pictureId'] = this.pictureId;
//     data['city'] = this.city;
//     data['rating'] = this.rating;
//     if (this.menus != null) {
//       data['menus'] = this.menus!.toJson();
//     }
//     return data;
//   }
// }
//
// class Menus {
//   List<Foods>? foods;
//   List<Drinks>? drinks;
//
//   Menus({this.foods, this.drinks});
//
//   Menus.fromJson(Map<String, dynamic> json) {
//     if (json['foods'] != null) {
//       foods = <Foods>[];
//       json['foods'].forEach((v) {
//         foods!.add(new Foods.fromJson(v));
//       });
//     }
//     if (json['drinks'] != null) {
//       drinks = <Drinks>[];
//       json['drinks'].forEach((v) {
//         drinks!.add(new Drinks.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.foods != null) {
//       data['foods'] = this.foods!.map((v) => v.toJson()).toList();
//     }
//     if (this.drinks != null) {
//       data['drinks'] = this.drinks!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Foods {
//   String? name;
//
//   Foods({this.name});
//
//   Foods.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }
//
// class Drinks {
//   String? name;
//
//   Drinks({this.name});
//
//   Drinks.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }
