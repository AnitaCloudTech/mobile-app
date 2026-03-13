import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/widgets/app_svg_viewer.dart';

class StoresOnMapScreen extends StatelessWidget {
  const StoresOnMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final appTypography = context.theme.appTypography;
    final List<String> titles = [
      'Milica & Anita Sweets',
      'Kostic Cakes Studio',
      'Urban Delights',
      'Velvet Crumb',
      'Marie\'s Tea Room',
      'The Dancing Scone',
      'The Jolly Croissant',
    ];

    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: titles.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (final context, final index) {
          final mapImage = index.isEven
              ? 'assets/images/map-img-1.png'
              : 'assets/images/map-img-2.png';

          return Container(
            width: 280,
            margin: EdgeInsets.only(
              left: Dimens.largePadding,
              right: index == titles.length - 1 ? Dimens.largePadding : 0,
              bottom: Dimens.largePadding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.corners),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.corners),
                    topRight: Radius.circular(Dimens.corners),
                  ),
                  child: Image.asset(
                    mapImage,
                    width: 280,
                    height: 96,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 280,
                      height: 96,
                      color: appColors.gray.withValues(alpha: 0.25),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.padding),
                  child: Column(
                    spacing: Dimens.padding,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titles[index],
                        style: appTypography.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'torte, mafini, krofne / cakes, cupcakes, donuts',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppDivider(),
                      Row(
                        children: [
                          AppSvgViewer(
                            Assets.icons.location,
                            color: appColors.primary,
                            width: 14,
                            height: 14,
                          ),
                          SizedBox(width: Dimens.padding),
                          Expanded(
                            child: Text(
                              'Kragujevac, Srbija / Serbia',
                              style: appTypography.caption,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppSvgViewer(
                            Assets.icons.clock,
                            color: appColors.primary,
                            width: 14,
                            height: 14,
                          ),
                          SizedBox(width: Dimens.padding),
                          Expanded(
                            child: Text(
                              '15 min, 1.8km, Besplatna dostava / Free delivery',
                              style: appTypography.caption,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
