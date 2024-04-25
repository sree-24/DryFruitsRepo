import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../modelClass/dryFruitsModelClass.dart';

class DryFruitsProviderClass extends ChangeNotifier {
  List<DryFruitsModelClass> dataList = [];
  List<DryFruitsModelClass> cartItems = [];
  int cartCount = 0;

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/300a98e2-422c-43d2-a6d9-f7ff8f4c391d'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      dataList =
          jsonResponse.map((data) => DryFruitsModelClass.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  void addToCart(int index) {
    cartItems.add(dataList[index]);
    cartCount++;
    Fluttertoast.showToast(
      msg: "${dataList[index].nutsName} added to cart",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    cartCount = 0;
    notifyListeners(); // Notify listeners of state change
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      if (item.price != null) {
        total += item.price!; // Accessing non-nullable int
      }
    }
    return total;
  }


}
