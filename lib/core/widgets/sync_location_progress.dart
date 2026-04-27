import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import 'custom_text.dart';

class SyncLocationProgress extends StatefulWidget {
  final String locationName;
  final Duration duration;
  final VoidCallback onComplete;
  final Duration delay;

  const SyncLocationProgress({
    super.key,
    required this.locationName,
    this.duration = const Duration(seconds: 5),
    required this.onComplete,
    this.delay = Duration.zero,
  });

  @override
  State<SyncLocationProgress> createState() => _SyncLocationProgressState();
}

class _SyncLocationProgressState extends State<SyncLocationProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isComplete = false;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isComplete = true;
        });
        widget.onComplete();
      }
    });

    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() => _hasStarted = true);
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      value: _hasStarted ? _controller.value : 0.0,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    "Fetching: ${widget.locationName}",
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (_isComplete)
                  const Icon(Icons.check, color: AppColors.darkGreen, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
