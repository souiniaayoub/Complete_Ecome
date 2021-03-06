import 'package:flutter/material.dart';
import 'package:pfe/Screens/Account.dart';
import 'package:pfe/Screens/Home.dart';
import 'package:pfe/Screens/shoping_cart.dart';
import 'package:pfe/Screens/favorite_screen.dart';
import 'package:pfe/api/cart_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pfe/cart/cart.dart' as cart;

class Functions {
  static void routeBottomBar(int i, BuildContext context) async {
    switch (i) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new HomeScreen()));
        break;
      case 1:
        //
        break;
      case 2:
        SharedPreferences pref = await SharedPreferences.getInstance();
        int userId = pref.getInt('user_id');
        String apiToken = pref.getString('api_token');
        if ((userId != null) || (apiToken != null)) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new Favorite(
                        userId: userId,
                      )));
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return Alert();
              });
        }

        break;
      case 3:
        CartApi cartApi = CartApi();

        SharedPreferences pref = await SharedPreferences.getInstance();
        int userId = pref.getInt('user_id');
        String apiToken = pref.getString('api_token');
        if ((userId != null) || (apiToken != null)) {
          cart.Cart car = await cartApi.fetchCart();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => new Cart(car.total)));
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return Alert();
              });
        }

        break;
      case 4:
        SharedPreferences pref = await SharedPreferences.getInstance();
        int userId = pref.getInt('user_id');
        String apiToken = pref.getString('api_token');
        if ((userId != null) || (apiToken != null)) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => new Account()));
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return Alert();
              });
        }

        break;
      default:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new HomeScreen()));
    }
  }
}
