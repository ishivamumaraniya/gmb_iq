import 'package:flutter/material.dart';
import 'package:gmb_iq/core/widgets/custom_scaffold.dart';

import 'found_accounts_state.dart';
import 'widgets/found_accounts_components.dart';

class FoundMobileView extends StatelessWidget {
  final FoundAccountsState state;

  const FoundMobileView({super.key, required this.state});

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FoundAccountsComponents.buildHeader(context),
                    const SizedBox(height: 15),
                    FoundAccountsComponents.buildConnectedAccount(state),
                    const SizedBox(height: 20),
                    FoundAccountsComponents.buildLocationsListHeader(context, state),
                    const SizedBox(height: 10),
                    FoundAccountsComponents.buildLocationsList(state),
                    if (!state.isExpanded && state.locations.length > 3) ...[
                      const SizedBox(height: 10),
                      FoundAccountsComponents.buildExpansionButton(state),
                    ],
                    const SizedBox(height: 25),
                    FoundAccountsComponents.buildSummaryBar(state),
                    const SizedBox(height: 16),
                    FoundAccountsComponents.buildActionButtons(context, state),
                    const Spacer(),
                    const SizedBox(height: 20),
                    FoundAccountsComponents.buildFooter(),
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
