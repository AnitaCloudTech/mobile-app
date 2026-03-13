import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/dimens.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/check_theme_status.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_divider.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/widgets/payment_item_widget.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/widgets/app_button.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String _selectedMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    final appTypography = context.theme.appTypography;
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Nacini placanja / Payment methods'),
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentItemWidget(
              onTap: () => setState(() => _selectedMethod = 'Cash'),
              title: 'Cash',
              iconPath: Assets.icons.money3,
              isActive: _selectedMethod == 'Cash',
            ),
            PaymentItemWidget(
              onTap: () => setState(() => _selectedMethod = 'Wallet'),
              title: 'Wallet',
              iconPath: Assets.icons.wallet,
              isActive: _selectedMethod == 'Wallet',
            ),
            SizedBox.shrink(),
            Text('Dodaj karticu / Add a credit card', style: appTypography.bodyLarge),
            PaymentItemWidget(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Dodavanje kartice uskoro / Add card soon')),
                );
              },
              title: 'Add card',
              iconPath: Assets.icons.card,
              showRadio: false,
            ),
            SizedBox.shrink(),
            Text('Dodatne opcije / More payment options', style: appTypography.bodyLarge),
            Column(
              children: [
                PaymentItemWidget(
                  onTap: () => setState(() => _selectedMethod = 'PayPal'),
                  title: 'PayPal',
                  logoPath:
                      checkDarkMode(context) ? null : Assets.icons.paypalLogo,
                  showBorder: false,
                  isActive: _selectedMethod == 'PayPal',
                ),
                AppDivider(),
                PaymentItemWidget(
                  onTap: () => setState(() => _selectedMethod = 'Apple Pay'),
                  title: 'Apple Pay',
                  logoPath:
                      checkDarkMode(context) ? null : Assets.icons.appleLogo,
                  showBorder: false,
                  isActive: _selectedMethod == 'Apple Pay',
                ),
                AppDivider(),
                PaymentItemWidget(
                  onTap: () => setState(() => _selectedMethod = 'Google Pay'),
                  title: 'Google Pay',
                  logoPath:
                      checkDarkMode(context) ? null : Assets.icons.googleLogo,
                  showBorder: false,
                  isActive: _selectedMethod == 'Google Pay',
                ),
              ],
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
              SnackBar(content: Text('Placanje potvrdeno / Confirmed: $_selectedMethod')),
            );
          },
          title: 'Potvrdi placanje / Payment confirmation',
          textStyle: appTypography.bodyLarge,
          borderRadius: Dimens.corners,
          margin: EdgeInsets.symmetric(vertical: Dimens.largePadding),
        ),
      ),
    );
  }
}
