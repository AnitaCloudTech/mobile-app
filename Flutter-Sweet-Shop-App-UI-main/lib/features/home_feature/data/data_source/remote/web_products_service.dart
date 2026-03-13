import 'dart:convert';

import 'package:http/http.dart' as http;

class WebProductsService {
  const WebProductsService();

  Future<List<String>> fetchProductNames() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=4'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load products from web source.');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw Exception('Unexpected response format.');
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map((item) => (item['title'] ?? '').toString())
        .where((title) => title.trim().isNotEmpty)
        .map(_toProductName)
        .toList();
  }

  String _toProductName(String title) {
    final words = title
        .trim()
        .split(RegExp(r'\s+'))
        .take(2)
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');

    return '$words Cake';
  }
}
