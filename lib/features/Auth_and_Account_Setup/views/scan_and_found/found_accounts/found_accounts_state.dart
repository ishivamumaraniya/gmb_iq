import 'package:flutter/foundation.dart';

class LocationData {
  final String name;
  final String address;
  final double rating;
  final int reviews;
  bool isSelected;

  LocationData({
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    this.isSelected = false,
  });
}

class FoundAccountsState {
  final List<LocationData> locations;
  final bool isExpanded;
  final bool isSyncing;
  final int completedSyncs;
  final int selectedCount;
  final double totalMonthlyPrice;
  final VoidCallback onExpandToggle;
  final ValueChanged<bool?> onSelectAll;
  final Function(int, bool?) onLocationToggle;
  final VoidCallback onConnect;
  final VoidCallback onChangeAccount;
  final VoidCallback onSyncComplete;

  FoundAccountsState({
    required this.locations,
    required this.isExpanded,
    required this.isSyncing,
    required this.completedSyncs,
    required this.selectedCount,
    required this.totalMonthlyPrice,
    required this.onExpandToggle,
    required this.onSelectAll,
    required this.onLocationToggle,
    required this.onConnect,
    required this.onChangeAccount,
    required this.onSyncComplete,
  });
}
