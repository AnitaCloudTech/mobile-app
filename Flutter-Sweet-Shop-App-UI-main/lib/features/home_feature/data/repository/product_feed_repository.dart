import 'package:flutter_sweet_shop_app_ui/features/home_feature/data/data_source/local/sample_data.dart';
import 'package:flutter_sweet_shop_app_ui/features/home_feature/data/data_source/remote/web_products_service.dart';

class ProductFeedRepository {
  ProductFeedRepository({WebProductsService? service})
    : _service = service ?? const WebProductsService();

  final WebProductsService _service;

  Future<List<String>> getFeaturedProductNames() async {
    // Keep storefront names aligned with the local curated image set.
    return productsName;
  }
}
