import 'package:flutter/material.dart';
import 'package:gmb_iq/core/widgets/CustomBorderContainers.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';

import 'found_accounts_state.dart';
import 'widgets/found_accounts_components.dart';

class FoundDesktopView extends StatelessWidget {
  final FoundAccountsState state;

  const FoundDesktopView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsetsGeometry.zero,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Column: Success Header & Account
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
                  children: [
                    FoundAccountsComponents.buildHeader(context, alignment: CrossAxisAlignment.start),
                    const SizedBox(height: 30),
                    FoundAccountsComponents.buildConnectedAccount(state),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 40),

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FoundAccountsComponents.buildLocationsListHeader(context, state),
                        const SizedBox(height: 15),
                        FoundAccountsComponents.buildLocationsList(state),
                        if (!state.isExpanded && state.locations.length > 3) ...[
                          const SizedBox(height: 10),
                          FoundAccountsComponents.buildExpansionButton(state),
                        ],
                        const SizedBox(height: 30),
                        FoundAccountsComponents.buildSummaryBar(state),
                        const SizedBox(height: 20),
                        FoundAccountsComponents.buildActionButtons(context, state),
                        const SizedBox(height: 20),
                        FoundAccountsComponents.buildFooter(),
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
