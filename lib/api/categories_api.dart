import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/models/category.dart';
import 'package:news_app/utilities/api_utilities.dart';

class CategoriesAPI {
  List<Category> categories = List<Category>();
  Future<List<Category>> fetchAllCategories() async {
    String categoriesUrl = base_api + all_categories;
    var response = await http.get(categoriesUrl);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        Category category =
            Category(item['id'].toString(), item['title'].toString());
        categories.add(category);
      }
    }
    return categories;
  }
}
