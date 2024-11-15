import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:newpro/Model/foodmodel.dart';
import 'package:newpro/Widget/MealsWidget.dart';

class MealProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;
  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;
  bool get isError {
    return _isError;
  }

  List<Categories> _products = [];
  List<Categories> get products {
    return [..._products];
  }

  Future getAllMealsData({required BuildContext context}) async {
    try {
      _isLoading = true;
      notifyListeners();

      var response = await https.get(
        Uri.parse("http://www.themealdb.com/api/json/v1/1/categories.php"),
      );

      print("Request URL: http://www.themealdb.com/api/json/v1/1/categories.php");
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];

        var extractedData = json.decode(response.body);
        final List<dynamic> productDetails = extractedData['categories']; // Corrected key

        for (var i = 0; i < productDetails.length; i++) {
          _products.add(
            Categories(
              idCategory: productDetails[i]['idCategory'].toString(),
              strCategory: productDetails[i]['strCategory'].toString(),
              strCategoryThumb: productDetails[i]['strCategoryThumb'].toString(),
              strCategoryDescription: productDetails[i]['strCategoryDescription'].toString(),
            ),
          );
        }

        print('Product details: ${_products.toString()}');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      print('Error in product loading: ${e.toString()}');
      _isLoading = false;
      _isSelect = false;
      notifyListeners();
    }
  }
}
