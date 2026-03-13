import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';

import '../../../../core/theme/dimens.dart';
import '../../data/data_source/local/sample_data.dart';
import 'product_details_screen.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Specijalne ponude / Special offers'),
      body: ListView.separated(
        itemCount: banners.length,
        itemBuilder: (final context, final index) {
          return InkWell(
            onTap: () {
              appPush(context, ProductDetailsScreen());
            },
            borderRadius: BorderRadius.circular(Dimens.largePadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.largePadding),
              child: Image.asset(banners[index]),
            ),
          );
        },
        separatorBuilder: (final context, final index) {
          return SizedBox(height: Dimens.largePadding);
        },
      ),
    );
  }
}
