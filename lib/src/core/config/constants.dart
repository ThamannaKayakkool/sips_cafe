import 'package:flutter/material.dart';

import 'assets.dart';

//height

SizedBox kSizedBox4 = const SizedBox(
  height: 4,
);
SizedBox kSizedBox8 = const SizedBox(
  height: 8,
);

SizedBox kSizedBox10 = const SizedBox(
  height: 10,
);
SizedBox kSizedBox15 = const SizedBox(
  height: 15,
);
SizedBox kSizedBox20 = const SizedBox(
  height: 20,
);
SizedBox kSizedBox25 = const SizedBox(
  height: 25,
);

//width

SizedBox kSizedBoxW12 = const SizedBox(
  width: 12,
);
SizedBox kSizedBoxW15 = const SizedBox(
  width: 15,
);
SizedBox kSizedBoxW25 = const SizedBox(
  width: 25,
);
SizedBox kSizedBoxW35 = const SizedBox(
  width: 35,
);

final List<Map<String, dynamic>> menuItem = [
  {"image": Assets.allMenu, "type": "38"},
  {"image": Assets.burger, "type": "6"},
  {"image": Assets.juice, "type": "8"},
  {"image": Assets.pizza, "type": "5"},
  {"image": Assets.salad, "type": "4"},
  {"image": Assets.taco, "type": "3"},
  {"image": Assets.pasta, "type": "6"},
  {"image": Assets.noodles, "type": "6"},
];

final List<Map<String, dynamic>> menuAllItem = [
  {
    "image": Assets.beefBurger,
    "name": "Beef Burger",
    "price": "38.06",
    "category": "Burger"
  },
  {
    "image": Assets.mangoJuice,
    "name": "Mango Juice",
    "price": "10.90",
    "category": "Juice"
  },
  {
    "image": Assets.tempehTacos,
    "name": "Veggie Tacos",
    "price": "22.22",
    "category": "Taco"
  },
  {
    "image": Assets.fruitSalad,
    "name": "Fruit Salad",
    "price": "15.15",
    "category": "Salad"
  },
  {
    "image": Assets.pepperoniPizza,
    "name": "Pepperoni Pizza",
    "price": "25.11",
    "category": "Pizza"
  },
  {
    "image": Assets.pinkSaucePasta,
    "name": "Pink Sauce Pasta",
    "price": "45.09",
    "category": "Pasta"
  },
  {
    "image": Assets.fieryNoodles,
    "name": "Fiery Noodles",
    "price": "20.01",
    "category": "Noodles"
  },
  {
    "image": Assets.chickenBurger,
    "name": "Chicken Burger",
    "price": "35.06",
    "category": "Burger"
  },
  {
    "image": Assets.avocadoSmoothie,
    "name": "Avocado Smoothie",
    "price": "10.06",
    "category": "Juice"
  },
  {
    "image": Assets.chowMein,
    "name": "Chow Mein",
    "price": "16.01",
    "category": "Noodles"
  },
  {
    "image": Assets.chickenPasta,
    "name": "Chicken Pasta",
    "price": "42.22",
    "category": "Pasta"
  },
  {
    "image": Assets.cobbSalad,
    "name": "Cobb Salad",
    "price": "11.05",
    "category": "Salad"
  },
  {
    "image": Assets.sausagePizza,
    "name": "Sausage Pizza",
    "price": "25.11",
    "category": "Pizza"
  },
  {
    "image": Assets.spicyChicken,
    "name": "Spicy Chicken",
    "price": "45.09",
    "category": "Noodles"
  },
  {
    "image": Assets.spaghetti,
    "name": "Spaghetti",
    "price": "20.01",
    "category": "Pasta"
  },
  {
    "image": Assets.tenderCoconutShake,
    "name": "Tender Shake",
    "price": "35.06",
    "category": "Juice"
  },
  {
    "image": Assets.blueBerrySmoothie,
    "name": "Blueberry Smoothie",
    "price": "38.06",
    "category": "Juice"
  },
  {
    "image": Assets.pattyBurger,
    "name": "Patty Burger",
    "price": "10.90",
    "category": "Burger"
  },
  {
    "image": Assets.chickenTacos,
    "name": "Chicken Tacos",
    "price": "22.22",
    "category": "Taco"
  },
  {
    "image": Assets.bbqChickenPizza,
    "name": "BBQ Chicken Pizza",
    "price": "35.15",
    "category": "Pizza"
  },
  {
    "image": Assets.butterscotchShake,
    "name": "Butterscotch Shake",
    "price": "25.11",
    "category": "Juice"
  },
  {
    "image": Assets.cheesyBakedPasta,
    "name": "Cheesy Pasta",
    "price": "45.09",
    "category": "Pasta"
  },
  {
    "image": Assets.crispyCheeseBurger,
    "name": "CheeseBurger",
    "price": "20.01",
    "category": "Burger"
  },
  {
    "image": Assets.friedEggNoodles,
    "name": "Fried Egg Noodles",
    "price": "35.06",
    "category": "Noodles"
  },
  {
    "image": Assets.gardenSalad,
    "name": "Garden Salad",
    "price": "38.06",
    "category": "Salad"
  },
  {
    "image": Assets.orangeJuice,
    "name": "Orange Juice",
    "price": "10.90",
    "category": "Juice"
  },
  {
    "image": Assets.beefPizza,
    "name": "Beef Pizza",
    "price": "22.22",
    "category": "Pizza"
  },
  {
    "image": Assets.shrimpRamen,
    "name": "Shrimp Ramen",
    "price": "15.15",
    "category": "Noodles"
  },
  {
    "image": Assets.bbqChickenBurger,
    "name": "BBQ Burger",
    "price": "25.11",
    "category": "Burger"
  },
  {
    "image": Assets.sardinePasta,
    "name": "Sardine Pasta",
    "price": "45.09",
    "category": "Pasta"
  },
  {
    "image": Assets.beefTacos,
    "name": "Beef Tacos",
    "price": "20.01",
    "category": "Taco"
  },
  {
    "image": Assets.pineappleJuice,
    "name": "Pineapple Juice",
    "price": "38.06",
    "category": "Juice"
  },
  {
    "image": Assets.veggieChowMein,
    "name": "Veggie Chow Mein",
    "price": "10.90",
    "category": "Noodles"
  },
  {
    "image": Assets.alfredoPasta,
    "name": "Alfredo Pasta",
    "price": "29.05",
    "category": "Pasta"
  },
  {
    "image": Assets.radishGreenSalad,
    "name": "Radish Green Salad",
    "price": "10.15",
    "category": "Salad"
  },
  {
    "image": Assets.veggiePizza,
    "name": "Veggie Pizza",
    "price": "29.08",
    "category": "Pizza"
  },
  {
    "image": Assets.lambBurger,
    "name": "Lamb Burger",
    "price": "55.09",
    "category": "Burger"
  },
  {
    "image": Assets.strawberryShake,
    "name": "Strawberry Shake",
    "price": "25.06",
    "category": "Juice"
  },
];
List<String> category=[
  "All Menu",
  "Burger",
  "Juice",
  "Pizza",
  "Salad",
  "Taco",
  "Pasta",
  "Noodles",
];