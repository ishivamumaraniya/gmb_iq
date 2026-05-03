import 'package:flutter/material.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';

import '../found_accounts/found_accounts_state.dart';
import 'widgets/sync_complete_components.dart';

class SyncCompleteMobileView extends StatelessWidget {
  final List<LocationData> syncedLocations;

  const SyncCompleteMobileView({super.key, required this.syncedLocations});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      maxWidth: 500,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    SyncCompleteComponents.buildHeader(),
                    const SizedBox(height: 32),
                    SyncCompleteComponents.buildLocationsList(context, syncedLocations),
                    const SizedBox(height: 20),
                    SyncCompleteComponents.buildSecurityInfo(),
                    const Spacer(),
                    const SizedBox(height: 20),
                    SyncCompleteComponents.buildActionButtons(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
