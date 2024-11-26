import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://api.example.com'; // Thay đổi URL này thành API của bạn

  Future<List<dynamic>> fetchFoodItems() async {
    final response = await http.get(Uri.parse('$baseUrl/food_items'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Không thể tải dữ liệu');
    }
  }
}
