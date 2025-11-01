import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryService {
  static const String baseUrl = 'https://fakestoreapi.com';

  /// Mengambil semua kategori (List<String>)
  Future<List<String>> fetchCategories() async {
    final url = Uri.parse('$baseUrl/products/categories');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(resp.body);
      // convert dynamic list to List<String>
      return jsonList.map((e) => e.toString()).toList();
    } else {
      throw Exception('Gagal memuat kategori: ${resp.statusCode}');
    }
  }
}
