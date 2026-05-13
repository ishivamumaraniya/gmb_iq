import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/CustomBorderContainers.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SettingsDesktopView extends StatefulWidget {
  const SettingsDesktopView({super.key});

  @override
  State<SettingsDesktopView> createState() => _SettingsDesktopViewState();
}

class _SettingsDesktopViewState extends State<SettingsDesktopView> {
  String _selectedItem = "Account";

  final List<Map<String, dynamic>> _menuItems = [
    {"title": "Account", "icon": Icons.person_outline, "isV2": false},
    {"title": "Notifications", "icon": Icons.notifications_none, "isV2": false},
    {"title": "Billing & subscription", "icon": Icons.credit_card, "isV2": false},
    {"title": "Privacy & data", "icon": Icons.shield_outlined, "isV2": false},
    {"title": "Team", "icon": Icons.people_outline, "isV2": true},
    {"title": "Integrations", "icon": Icons.power_outlined, "isV2": true},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'Setting', subtitle: 'Manage your account, billing, and preferences.'),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: AppColors.customBorderColorGrey)),
            ),
            child: ListView.separated(
              itemCount: _menuItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = _menuItems[index];
                final isSelected = _selectedItem == item["title"];
                final isV2 = item["isV2"];

                return InkWell(
                  onTap: isV2
                      ? null
                      : () {
                          setState(() {
                            _selectedItem = item["title"];
                          });
                        },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade50 : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          item["icon"],
                          size: 20,
                          color: isV2 ? AppColors.lightGrey : (isSelected ? Colors.blue : AppColors.textSecondary),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomText(
                            item["title"],
                            fontSize: 14,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                            color: isV2 ? AppColors.lightGrey : (isSelected ? Colors.blue : const Color(0xFF333333)),
                          ),
                        ),
                        if (isV2)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12)),
                            child: const CustomText("V2", fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Content Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
              child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 800), child: _buildContent()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedItem) {
      case "Account":
        return _buildAccountView();
      case "Notifications":
        return _buildNotificationsView();
      case "Billing & subscription":
        return _buildBillingView();
      default:
        return const Center(child: CustomText("Not implemented yet.", fontSize: 14));
    }
  }

  Widget _buildAccountView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Profile", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Update your personal details and public profile.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: const Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.customBorderColorGrey),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const CustomText("Change photo", fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () {},
                            child: const CustomText("Remove", fontSize: 13, color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const CustomText("JPG, GIF or PNG. 1MB max.", fontSize: 12, isSecondary: true),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: _buildTextField("First name", "Wade")),
                  const SizedBox(width: 24),
                  Expanded(child: _buildTextField("Last name", "Warren")),
                ],
              ),
              const SizedBox(height: 24),
              _buildTextField("Email address", "wade@example.com"),
              const SizedBox(height: 24),
              _buildTextField("Phone number", "+1 (555) 123-4567"),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Preferences", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Adjust your regional settings and time format.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: _buildDropdownField("Language", "English (US)")),
                  const SizedBox(width: 24),
                  Expanded(child: _buildDropdownField("Timezone", "Eastern Time (US & Canada)")),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const CustomText("Discard changes", fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                elevation: 0,
              ),
              child: const CustomText("Save changes", fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 48),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          // borderColor: Colors.red.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Danger Zone", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Permanently remove your account and data.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade200),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red.shade50.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText("Delete account", fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red.shade700),
                        const SizedBox(height: 4),
                        CustomText("Once you delete your account, there is no going back.", fontSize: 13, color: Colors.red.shade700),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        elevation: 0,
                      ),
                      child: const CustomText("Delete account", fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Notification channels", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Choose where you want to receive alerts.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 32),
              _buildSwitchRow(Icons.email_outlined, "Email notifications", "Sent to wade@example.com", true),
              const SizedBox(height: 24),
              _buildSwitchRow(Icons.phone_iphone, "Push notifications", "Coming with mobile app", false, isV2: true),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("What to notify me about", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Pick which events trigger an alert.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 32),
              _buildCheckboxRow("New review", "When a customer leaves a new review on any location", true, false),
              const SizedBox(height: 24),
              _buildCheckboxRow("Critical review", "When a 1 or 2 star review is received", true, false, isCritical: true),
              const SizedBox(height: 24),
              _buildCheckboxRow("AI task complete", "When a bulk reply or scheduled task finishes", false, false),
              const SizedBox(height: 24),
              _buildCheckboxRow("Weekly summary", "Monday morning recap of the past week's activity", true, false),
              const SizedBox(height: 24),
              _buildCheckboxRow("Account & billing", "Payment issues, plan changes, or security alerts", true, false),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Quiet hours", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Pause non-critical notifications during certain hours.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              _buildSwitchRow(Icons.lock_outline, "Enable quiet hours", "", false, isV2: true, noSubtitle: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBillingView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText("Current plan", fontSize: 18, fontWeight: FontWeight.bold),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: CustomText("Active", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const CustomText("Your subscription details.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: _buildPlanBox("PLAN", "Pro")),
                  const SizedBox(width: 16),
                  Expanded(child: _buildPlanBox("LOCATIONS", "3 of unlimited")),
                  const SizedBox(width: 16),
                  Expanded(child: _buildPlanBox("NEXT BILLING", "Apr 23, 2026")),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.customBorderColorGrey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const CustomText("Cancel subscription", fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      elevation: 0,
                    ),
                    child: const CustomText("Change plan", fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Plan usage this month", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("How much of your plan you're using.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 32),
              _buildProgressRow("AI replies generated", "247 of 1,000", 0.247),
              const SizedBox(height: 24),
              _buildProgressRow("Bulk reply tasks", "8 of 50", 0.16),
              const SizedBox(height: 24),
              _buildProgressRow("Storage used", "1.2 GB of 10 GB", 0.12),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText("Payment method", fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              const CustomText("Charged automatically each month.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              _buildPaymentMethodRow("Visa ending in 4242", "Expires 08 / 2027", isPrimary: true),
              const SizedBox(height: 16),
              _buildPaymentMethodRow("Visa ending in 4242", "Expires 08 / 2027"),
            ],
          ),
        ),
        const SizedBox(height: 24),
        CustomBorderContainer(
          maxWidth: double.infinity,
          padding: const EdgeInsets.all(32),
          borderRadius: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText("Invoice history", fontSize: 18, fontWeight: FontWeight.bold),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.customBorderColorGrey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const CustomText("Download all", fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const CustomText("Receipts and payment records.", fontSize: 14, isSecondary: true),
              const SizedBox(height: 24),
              _buildInvoiceRow("Mar 23, 2026", "Pro plan • 3 locations", "\$24.00"),
              const SizedBox(height: 16),
              _buildInvoiceRow("Feb 23, 2026", "Pro plan • 3 locations", "\$24.00"),
              const SizedBox(height: 16),
              _buildInvoiceRow("Jan 23, 2026", "Pro plan • 3 locations", "\$24.00"),
            ],
          ),
        ),
      ],
    );
  }

  // --- Helper Widgets ---

  Widget _buildTextField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(label, fontSize: 12, fontWeight: FontWeight.bold, isSecondary: true),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.customBorderColorGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.customBorderColorGrey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(label, fontSize: 12, fontWeight: FontWeight.bold, isSecondary: true),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.customBorderColorGrey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(value, fontSize: 14),
              const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchRow(IconData icon, String title, String subtitle, bool value, {bool isV2 = false, bool noSubtitle = false}) {
    return Row(
      children: [
        Icon(icon, size: 24, color: AppColors.textSecondary),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(title, fontSize: 16, fontWeight: FontWeight.bold),
                  if (isV2) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12)),
                      child: const CustomText("V2", fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ],
              ),
              if (!noSubtitle) const SizedBox(height: 4),
              if (!noSubtitle) CustomText(subtitle, fontSize: 14, isSecondary: true),
            ],
          ),
        ),
        Switch(value: value, onChanged: isV2 ? null : (val) {}, activeColor: Colors.white, activeTrackColor: Colors.blue),
      ],
    );
  }

  Widget _buildCheckboxRow(String title, String subtitle, bool emailValue, bool pushValue, {bool isCritical = false}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(title, fontSize: 16, fontWeight: FontWeight.bold),
                  if (isCritical) ...[const SizedBox(width: 8), const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 16)],
                ],
              ),
              const SizedBox(height: 4),
              CustomText(subtitle, fontSize: 14, isSecondary: true),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(value: emailValue, onChanged: (v) {}, activeColor: Colors.blue),
            const CustomText("Email", fontSize: 14, isSecondary: true),
            const SizedBox(width: 16),
            Checkbox(value: pushValue, onChanged: null),
            const CustomText("Push", fontSize: 14, isSecondary: true),
          ],
        ),
      ],
    );
  }

  Widget _buildPlanBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.customBorderColorGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title, fontSize: 10, fontWeight: FontWeight.bold, isSecondary: true),
          const SizedBox(height: 8),
          CustomText(value, fontSize: 20, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget _buildProgressRow(String title, String value, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title, fontSize: 14, fontWeight: FontWeight.w500),
            CustomText(value, fontSize: 14, fontWeight: FontWeight.w600),
          ],
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade200,
          color: Colors.blue,
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodRow(String title, String subtitle, {bool isPrimary = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.customBorderColorGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.credit_card, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(title, fontSize: 16, fontWeight: FontWeight.w600),
                    if (isPrimary) ...[
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: CustomText("Primary", fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                CustomText(subtitle, fontSize: 13, isSecondary: true),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.customBorderColorGrey),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const CustomText("Update", fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(String date, String plan, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(date, fontSize: 14, fontWeight: FontWeight.w600),
            const SizedBox(height: 4),
            CustomText(plan, fontSize: 13, isSecondary: true),
          ],
        ),
        Row(
          children: [
            CustomText(amount, fontSize: 14, fontWeight: FontWeight.bold),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: CustomText("Paid", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green.shade700),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.file_download_outlined, color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
