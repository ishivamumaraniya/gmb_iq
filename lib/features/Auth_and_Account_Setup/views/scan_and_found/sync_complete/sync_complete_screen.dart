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
