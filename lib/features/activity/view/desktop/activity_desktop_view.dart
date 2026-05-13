import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/CustomBorderContainers.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ActivityDesktopView extends StatelessWidget {
  const ActivityDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'Activity',
        subtitle: 'Track your AI operations and time saved',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText("Activity by IQ AI", fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                const CustomText("Monitor ongoing AI tasks and track your time saved.", fontSize: 14, isSecondary: true),
                const SizedBox(height: 24),
                _buildTotalTimeSavedCard(),
                const SizedBox(height: 24),
                _buildInProgressTaskCard(),
                const SizedBox(height: 48),
                const CustomText("Task History", fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 24),
                _buildTaskHistoryItem("Bulk Apology Drafts", "Today, 10:42 AM", "12 Critical Reviews", "1h 15m"),
                const SizedBox(height: 16),
                _buildTaskHistoryItem("Weekly AI Replies", "Yesterday, 4:00 PM", "124 Positive Reviews", "8h 30m"),
                const SizedBox(height: 16),
                _buildTaskHistoryItem("Monthly Engagement Sync", "May 10, 2:15 PM", "3 Locations synced", "2h 45m"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalTimeSavedCard() {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      padding: const EdgeInsets.all(32),
      borderRadius: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.access_time, color: Colors.blue, size: 32),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText("Total Time Saved", fontSize: 14, isSecondary: true),
                  const SizedBox(height: 4),
                  const CustomText("148 hrs 30m", fontSize: 32, fontWeight: FontWeight.bold),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          "+12H SAVE THIS MONTH",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.customBorderColorGrey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText("Auto Replies", fontSize: 12, isSecondary: true),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.bolt, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        const CustomText("96 hrs", fontSize: 16, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                Container(
                  width: 1,
                  height: 40,
                  color: AppColors.customBorderColorGrey,
                ),
                const SizedBox(width: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText("Bulk Replies", fontSize: 12, isSecondary: true),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome, color: Colors.blue, size: 16),
                        const SizedBox(width: 4),
                        const CustomText("52 hrs 30m", fontSize: 16, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProgressTaskCard() {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      padding: const EdgeInsets.all(32),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.blue, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CustomText("Generating Sparkle AI Replies", fontSize: 16, fontWeight: FontWeight.bold),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const CustomText(
                            "IN PROGRESS",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const CustomText("Processing 56 reviews across 3 locations", fontSize: 14, isSecondary: true),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.customBorderColorGrey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const CustomText("Pause Task", fontSize: 14, isSecondary: true),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText("34 / 56 Replies Generated", fontSize: 14, fontWeight: FontWeight.w600),
              const CustomText("60%", fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.blue.shade50,
            color: Colors.blue,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              const CustomText("Estimated time remaining: ", fontSize: 13, isSecondary: true),
              const CustomText("1m 12s", fontSize: 13, fontWeight: FontWeight.bold),
              const SizedBox(width: 32),
              const Icon(Icons.trending_up, size: 16, color: Colors.green),
              const SizedBox(width: 4),
              const CustomText("Projected time saved: ", fontSize: 13, color: Colors.green),
              const CustomText("~4.5 hrs", fontSize: 13, fontWeight: FontWeight.bold, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskHistoryItem(String title, String date, String detail, String timeSaved) {
    return CustomBorderContainer(
      maxWidth: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      borderRadius: 12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.green.shade700, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title, fontSize: 16, fontWeight: FontWeight.w600),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    CustomText(date, fontSize: 12, isSecondary: true),
                    const SizedBox(width: 12),
                    Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppColors.customBorderColorGrey, shape: BoxShape.circle)),
                    const SizedBox(width: 12),
                    CustomText(detail, fontSize: 12, isSecondary: true),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomText("Time Saved", fontSize: 12, isSecondary: true),
              const SizedBox(height: 4),
              CustomText(timeSaved, fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green.shade700),
            ],
          ),
        ],
      ),
    );
  }
}
