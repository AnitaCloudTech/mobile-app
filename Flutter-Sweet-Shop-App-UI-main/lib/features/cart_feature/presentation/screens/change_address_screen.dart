import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/sized_context.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_svg_viewer.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  int _selectedAddressIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appTypography = context.theme.appTypography;
    final appColors = context.theme.appColors;
    final List<String> titles = ['Home', 'Office', 'Parents\' house'];
    final List<String> addresses = [
      'Grada Sirena 14, Kragujevac',
      'Svetozara Markovica 77, Kragujevac',
      'Kralja Aleksandra 1, Karadjordjevica 16, Kragujevac',
    ];

    return AppScaffold(
      appBar: GeneralAppBar(title: 'Promena adrese / Change address'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              itemCount: titles.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (final context, final index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedAddressIndex = index;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: AppSvgViewer(
                          Assets.icons.location,
                          color: appColors.primary,
                        ),
                        title: Text(
                          titles[index],
                          style: appTypography.bodyLarge,
                        ),
                        trailing: Radio<int>(
                          value: index,
                          groupValue: _selectedAddressIndex,
                          onChanged: (final value) {
                            if (value == null) return;
                            setState(() {
                              _selectedAddressIndex = value;
                            });
                          },
                          activeColor: appColors.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 42,
                          right: Dimens.largePadding,
                          bottom: Dimens.largePadding,
                        ),
                        child: Text(
                          addresses[index],
                          style: appTypography.bodySmall.copyWith(
                            color: appColors.gray4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (final context, final index) {
                return AppDivider();
              },
            ),
            SizedBox(height: Dimens.veryLargePadding),
            SizedBox(
              width: context.widthPx,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  dashPattern: [4],
                  strokeWidth: 1,
                  radius: Radius.circular(Dimens.corners),
                  color: appColors.primary,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  child: Padding(
                    padding: EdgeInsets.all(Dimens.mediumPadding),
                    child: Center(
                      child: Text(
                        '+ Dodaj novu adresu / Add a new address',
                        style: appTypography.bodyLarge.copyWith(
                          color: appColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: Dimens.largePadding,
          right: Dimens.largePadding,
          bottom: Dimens.padding,
        ),
        child: AppButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Adresa sacuvana / Address saved: ${titles[_selectedAddressIndex]}',
                ),
              ),
            );
          },
          title: 'Primeni / Apply',
          textStyle: appTypography.bodyLarge,
          borderRadius: Dimens.corners,
          margin: EdgeInsets.symmetric(vertical: Dimens.largePadding),
        ),
      ),
    );
  }
}
