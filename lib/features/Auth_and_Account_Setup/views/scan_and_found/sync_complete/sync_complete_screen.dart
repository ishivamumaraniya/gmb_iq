import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmb_iq/core/constants/app_images.dart';
import 'package:gmb_iq/core/theme/app_colors.dart';
import 'package:gmb_iq/core/theme/theme_extensions.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_button.dart';
import 'package:gmb_iq/core/widgets/custom_image.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';
import 'package:gmb_iq/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/responsive/responsive_context.dart';
import '../found_accounts/found_accounts_state.dart';
import 'sync_complete_desktop_view.dart';
import 'sync_complete_mobile_view.dart';

class SyncCompleteScreen extends StatelessWidget {
  final List<LocationData> syncedLocations;

  const SyncCompleteScreen({super.key, required this.syncedLocations});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? SyncCompleteDesktopView(syncedLocations: syncedLocations)
        : SyncCompleteMobileView(syncedLocations: syncedLocations);
  }
}
