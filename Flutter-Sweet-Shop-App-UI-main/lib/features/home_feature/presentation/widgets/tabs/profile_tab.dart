import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/app_navigator.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/check_theme_status.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/bordered_container.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/screens/change_address_screen.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/presentation/screens/payment_methods_screen.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/dimens.dart';
import '../../../../../core/widgets/app_list_tile.dart';
import '../../../../../core/widgets/app_svg_viewer.dart';
import '../../../../../core/widgets/user_profile_image_widget.dart';
import '../../bloc/theme_cubit.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _notificationsEnabled = true;

  void _toggleNotifications(final bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 900),
        content: Text(
          value
              ? 'Notifikacije ukljucene / Notifications ON'
              : 'Notifikacije iskljucene / Notifications OFF',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final appTypography = context.theme.appTypography;
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Profil / Profile', showBackIcon: false),
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorderedContainer(
              child: ListTile(
                leading: UserProfileImageWidget(width: 56, height: 56),
                title: Text('Milica Kostic', style: appTypography.bodyLarge),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: Dimens.padding),
                  child: Text(
                    'Team: Anita Mijatovic',
                    style: appTypography.bodySmall.copyWith(
                      color: checkDarkMode(context)
                          ? appColors.white
                          : appColors.gray4,
                    ),
                  ),
                ),
                trailing: AppSvgViewer(
                  Assets.icons.edit,
                  width: 19,
                  color: checkDarkMode(context)
                      ? appColors.white
                      : appColors.gray4,
                ),
              ),
            ),
            Text(
              'General',
              style: appTypography.bodyLarge.copyWith(fontSize: 20),
            ),
            BorderedContainer(
              child: Column(
                spacing: Dimens.largePadding,
                children: [
                  AppListTile(
                    onTap: () {
                      appPush(context, PaymentMethodsScreen());
                    },
                    title: 'Nacin placanja / Payment method',
                    leadingIconPath: Assets.icons.cardPos,
                    padding: EdgeInsets.zero,
                  ),
                  AppListTile(
                    onTap: () {
                      appPush(context, ChangeAddressScreen());
                    },
                    title: 'Adrese / Addresses',
                    leadingIconPath: Assets.icons.location,
                    padding: EdgeInsets.zero,
                  ),
                  AppListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Jezik je srpski/engleski / Language is Serbian/English'),
                        ),
                      );
                    },
                    title: 'Jezik / Language',
                    leadingIconPath: Assets.icons.languageSquare,
                    padding: EdgeInsets.zero,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.largePadding,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: AppSvgViewer(Assets.icons.notification, width: 19),
                      title: Text('Notifikacije / Notification'),
                      subtitle: Text(
                        _notificationsEnabled ? 'ON' : 'OFF',
                        style: appTypography.labelMedium.copyWith(
                          color: appColors.gray4,
                        ),
                      ),
                      trailing: Switch(
                        value: _notificationsEnabled,
                        onChanged: _toggleNotifications,
                        activeColor: appColors.primary,
                      ),
                      onTap: () => _toggleNotifications(!_notificationsEnabled),
                    ),
                  ),
                  AppListTile(
                    onTap: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    title: 'Tamna tema / Dark theme',
                    leadingIconPath: Assets.icons.moon,
                    trailing: Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        value: checkDarkMode(context),
                        onChanged: (final value) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        activeTrackColor: appColors.primary,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox.shrink(),
                ],
              ),
            ),
            Text(
              'Podrska / Support',
              style: appTypography.bodyLarge.copyWith(fontSize: 20),
            ),
            BorderedContainer(
              child: Column(
                spacing: Dimens.largePadding,
                children: [
                  AppListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Hvala na feedback-u / Thanks for your feedback'),
                        ),
                      );
                    },
                    title: 'Povratne informacije / Feedback',
                    leadingIconPath: Assets.icons.noteText,
                    padding: EdgeInsets.zero,
                  ),
                  AppListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Podrska: support@sweetshop.rs'),
                        ),
                      );
                    },
                    title: 'Pomoc i podrska / Help and Support',
                    leadingIconPath: Assets.icons.infoCircle,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox.shrink(),
                ],
              ),
            ),
            BorderedContainer(
              child: AppListTile(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Odjava uspesna / Logged out')),
                  );
                },
                title: 'Odjavi se / Log out',
                leadingIconPath: Assets.icons.logout,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
