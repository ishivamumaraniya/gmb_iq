import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/responsive/responsive_context.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../cubit/auth_state.dart';
import '../../../../../core/storage/hive_setup.dart';
import 'found_accounts_state.dart';
import 'found_desktop_view.dart';
import 'found_mobile_view.dart';

class FoundGoogleAccountsScreen extends StatefulWidget {
  const FoundGoogleAccountsScreen({super.key});

  @override
  State<FoundGoogleAccountsScreen> createState() => _FoundGoogleAccountsScreenState();
}

class _FoundGoogleAccountsScreenState extends State<FoundGoogleAccountsScreen> {
  bool isExpanded = false;
  bool isSyncing = false;
  int completedSyncs = 0;
  final List<LocationData> locations = [
    LocationData(name: "Main Branch", address: "123 Main street, New York, NY 10001", rating: 4.6, reviews: 128, isSelected: true),
    LocationData(name: "Downtown Location", address: "456 Downtown Ave, New York, NY 10002", rating: 4.2, reviews: 89, isSelected: true),
    LocationData(name: "Westside Clinic", address: "789 West Blvd, New York, NY 10003", rating: 4.9, reviews: 241, isSelected: false),
    LocationData(name: "Time Square Clinic", address: "789 West Blvd, New York, NY 10003", rating: 4.8, reviews: 120, isSelected: false),
    LocationData(name: "Northside Clinic", address: "789 West Blvd, New York, NY 10003", rating: 4.5, reviews: 95, isSelected: false),
  ];

  int get selectedCount => locations.where((l) => l.isSelected).length;

  double get totalMonthlyPrice => selectedCount * 8.0;

  @override
  Widget build(BuildContext context) {
    final state = FoundAccountsState(
      locations: locations,
      isExpanded: isExpanded,
      isSyncing: isSyncing,
      completedSyncs: completedSyncs,
      selectedCount: selectedCount,
      totalMonthlyPrice: totalMonthlyPrice,
      onExpandToggle: () {
        setState(() {
          isExpanded = true;
        });
      },
      onSelectAll: (val) {
        setState(() {
          for (var l in locations) {
            l.isSelected = val ?? false;
          }
        });
      },
      onLocationToggle: (index, val) {
        setState(() {
          locations[index].isSelected = val ?? false;
        });
      },
      onConnect: () {
        setState(() {
          isSyncing = true;
          completedSyncs = 0;
        });
      },
      onChangeAccount: () {
        // Change account logic
      },

      onSyncComplete: () {
        completedSyncs++;
        final selectedLocations = locations.where((l) => l.isSelected).toList();
        if (completedSyncs == selectedLocations.length) {
          // All complete, save token to Hive
          // HiveSetup.token = 'dummy_token_123'; // Replace with actual token from your API if needed

          // Navigate after a small delay
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              context.read<AuthCubit>().updateStep(AuthStep.syncComplete, syncedLocations: selectedLocations);
            }
          });
        }
      },
    );

    return context.isDesktop ? FoundDesktopView(state: state) : FoundMobileView(state: state);
  }
}
