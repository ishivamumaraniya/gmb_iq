import 'package:flutter/material.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/theme/theme_extensions.dart';
import 'package:gmb_iq/features/main_layout/view/main_layout.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final List<Widget> actions;

  const CustomAppBar({super.key, required this.title, this.subtitle, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final borderColor = isDark ? AppColors.darkBorderColor : AppColors.customBorderColorGrey;

    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(title, fontSize: 22, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onSurface),
          if (subtitle != null) ...[
            CustomText(subtitle!, fontSize: 13, isSecondary: true, color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary),
          ],
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Open Menu',
        onPressed: () {
          MainLayout.scaffoldKey.currentState?.openDrawer();
        },
      ),
      centerTitle: false,
      elevation: 0,
      surfaceTintColor: Colors.transparent,

      backgroundColor: Colors.transparent,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, thickness: 0.5, color: borderColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
