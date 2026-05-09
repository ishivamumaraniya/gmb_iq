import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

// 1. Define an enhanced enum to hold the specific styling for each type
enum AppToastType {
  success(defaultTitle: 'Success', toastificationType: ToastificationType.success, style: ToastificationStyle.fillColored),
  error(
    defaultTitle: 'Error',
    toastificationType: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    showProgressBar: false,
    closeButtonType: CloseButtonShowType.none,
  ),
  info(defaultTitle: 'Info', toastificationType: ToastificationType.info, style: ToastificationStyle.fillColored);

  // The properties attached to each enum value
  final String defaultTitle;
  final ToastificationType toastificationType;
  final ToastificationStyle style;
  final bool showProgressBar;
  final CloseButtonShowType closeButtonType;

  const AppToastType({
    required this.defaultTitle,
    required this.toastificationType,
    required this.style,
    this.showProgressBar = true, // Default to true unless overridden (like in error)
    this.closeButtonType = CloseButtonShowType.always, // Default to always
  });
}

// 2. The single, unified Helper Class
class ToastHelper {
  static void show({
    required BuildContext context,
    required AppToastType type, // Pass your custom enum here
    String? customTitle,
  }) {
    toastification.show(
      context: context,
      type: type.toastificationType,
      style: type.style,
      title: Text(customTitle ?? type.defaultTitle),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      animationDuration: const Duration(milliseconds: 300),
      showProgressBar: type.showProgressBar,
      pauseOnHover: true,
      dragToClose: true,
    );
  }
}
