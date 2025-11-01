import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class ProductService {
  static const String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data produk');
    }
  }

  /// Mengambil produk berdasarkan kategori
  Future<List<Product>> fetchProductsByCategory(String category) async {
    final url = Uri.parse('https://fakestoreapi.com/products/category/$category');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat produk kategori $category');
    }
  }
}
