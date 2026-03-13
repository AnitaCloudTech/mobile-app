import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/data_source/local/fake_products.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/bloc/cart_cubit.dart';

import '../../../../core/theme/dimens.dart';
import '../../data/data_source/local/sample_data.dart';

enum OrderType { active, completed, canceled }

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({super.key, required this.orderType});

  final OrderType orderType;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final appTypography = context.theme.appTypography;

    return ListView.separated(
      itemCount: categoryProductsImage.length,
      itemBuilder: (final context, final index) {
        final priceRsd = (index + 18) * 117;
        final actionLabel = orderType == OrderType.active
            ? 'Prati'
            : orderType == OrderType.completed
                ? 'Detalji'
                : 'Ponovi';

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
            vertical: Dimens.veryLargePadding,
          ),
          child: Row(
            spacing: Dimens.largePadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 95,
                width: 95,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  child: Image.asset(
                    categoryProductsImage[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        'Sponge donut',
                        style: appTypography.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            spacing: Dimens.largePadding,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kolicina / Quantity: ${index + 3} kom',
                                style: appTypography.labelMedium.copyWith(
                                  color: appColors.gray4,
                                ),
                              ),
                              Text(
                                '$priceRsd RSD',
                                style: appTypography.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 34,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.padding,
                              ),
                              backgroundColor: orderType == OrderType.active
                                  ? appColors.primary
                                  : orderType == OrderType.completed
                                      ? appColors.successLight
                                      : appColors.error,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimens.smallCorners,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (orderType == OrderType.active) {
                                _showTrackingStatus(context);
                                return;
                              }

                              if (orderType == OrderType.canceled) {
                                final randomIndex = Random().nextInt(
                                  FakeProducts.products.length,
                                );
                                final product =
                                    FakeProducts.products[randomIndex];
                                context.read<CartCubit>().addItem(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Ponovo dodato u korpu: ${product.name}',
                                    ),
                                  ),
                                );
                                return;
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Porudzbina je isporucena / Order delivered',
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              actionLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: appTypography.labelMedium.copyWith(
                                color: appColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (final context, final index) {
        return AppDivider(height: 0);
      },
    );
  }

  void _showTrackingStatus(final BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.largePadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Status porudzbine / Order status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 12),
              Text('Priprema u toku / Preparing'),
              SizedBox(height: 8),
              Text('Kurir dolazi za oko 15 min / Courier arrives in ~15 min'),
              SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
