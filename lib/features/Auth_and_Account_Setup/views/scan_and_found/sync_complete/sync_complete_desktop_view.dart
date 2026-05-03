import 'package:flutter/material.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';

import '../found_accounts/found_accounts_state.dart';
import 'widgets/sync_complete_components.dart';

class SyncCompleteDesktopView extends StatelessWidget {
  final List<LocationData> syncedLocations;

  const SyncCompleteDesktopView({super.key, required this.syncedLocations});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsetsGeometry.zero,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Column: Success Header
          Expanded(
            flex: 1,
            child: CustomBorderContainer(
              wantBorder: false,
              myColor: Theme.of(context).primaryColor.withValues(alpha: .05),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SyncCompleteComponents.buildHeader(alignment: CrossAxisAlignment.start)],
                ),
              ),
            ),
          ),

          const SizedBox(width: 40),

          // Right Column: Synced Locations & Actions
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SyncCompleteComponents.buildLocationsList(context, syncedLocations),
                        const SizedBox(height: 20),
                        SyncCompleteComponents.buildSecurityInfo(),
                        const SizedBox(height: 30),
                        SyncCompleteComponents.buildActionButtons(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
