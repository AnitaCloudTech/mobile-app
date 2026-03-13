import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/models/product_model.dart';

import '../../../../../core/gen/assets.gen.dart';

class FakeProducts {
  static final List<ProductModel> products = [
    ProductModel(
      id: 0,
      name: 'Chocolate Cake',
      price: 4000,
      imageUrl: Assets.images.birthdayCakeCategory1.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 1,
      name: 'Strawberry Cake',
      price: 3700,
      imageUrl: Assets.images.birthdayCakeCategory2.path,
      rate: 7.5,
      weight: 1.0,
    ),
    ProductModel(
      id: 2,
      name: 'Cherry cake',
      price:780,
      imageUrl: Assets.images.birthdayCakeCategory3.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 3,
      name: 'Strawberry cupcake',
      price:280,
      imageUrl: Assets.images.cupcakeCategory1.path,
      rate: 7.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 4,
      name: 'Cupcake',
      price:350,
      imageUrl: Assets.images.cupcakeCategory2.path,
      rate: 9.3,
      weight: 1.5,
    ),
    ProductModel(
      id: 5,
      name: 'Cupcake',
      price:700 ,
      imageUrl: Assets.images.cupcakeCategory3.path,
      rate: 8.5,
      weight: 0.5,
    ),
    ProductModel(
      id: 6,
      name: 'Sponge donut',
      price:400,
      imageUrl: Assets.images.donutCategory1.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 7,
      name: 'Chocolate donut',
      price:300 ,
      imageUrl: Assets.images.donutCategory2.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 7,
      name: 'Mix donut',
      price:250 ,
      imageUrl: Assets.images.donutCategory3.path,
      rate: 6.5,
      weight: 1.5,
    ),
  ];
}
