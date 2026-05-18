import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_button.dart';

class ManageReviewDesktopView extends StatefulWidget {
  const ManageReviewDesktopView({super.key});

  @override
  State<ManageReviewDesktopView> createState() => _ManageReviewDesktopViewState();
}

class _ManageReviewDesktopViewState extends State<ManageReviewDesktopView> {
  int? _selectedReviewIndex;
  final Set<int> _checkedReviews = {};
  bool _isReplyPanelOpen = false;

  final List<Map<String, dynamic>> _reviews = [
    {
      "initials": "SM",
      "name": "Sarah Miller",
      "badge": "CRITICAL",
      "badgeColor": Colors.red,
      "time": "2h ago",
      "rating": 1,
      "text":
          "Terrible experience at the downtown location. We waited over an hour for our table even though we had a reservation. The staff was incredibly rude and unhelpful.",
      "hasDraft": true,
    },
    {
      "initials": "DJ", // Using DJ since Avatar image is not available
      "name": "David Jenkins",
      "badge": "NEEDS REPLY",
      "badgeColor": Colors.blue,
      "time": "4h ago",
      "rating": 4,
      "text":
          "Always a great experience here. The food is consistently good and the atmosphere is perfect for a quick lunch. Highly recommend!",
      "hasDraft": false,
    },
    {
      "initials": "TW",
      "name": "Thomas Wright",
      "badge": "POSITIVE",
      "badgeColor": Colors.green,
      "time": "8h ago",
      "rating": 4,
      "text": "Quick stop in while traveling. Fantastic coffee and the pastries were fresh. Exactly what we needed for the road trip.",
      "hasDraft": false,
    },
    {
      "initials": "MR",
      "name": "Maria Rodriguez",
      "badge": "REPLIED",
      "badgeColor": Colors.grey,
      "time": "Yesterday",
      "rating": 3,
      "text":
          "Good service overall, but it was a bit loud inside. Hard to have a conversation. Would probably come back during off-peak hours.",
      "hasDraft": false,
      "reply":
          "Hi Maria, thank you for your feedback! We're glad you enjoyed the service. We apologize for the noise level during your visit—weekends can definitely get quite busy. We'd love to welcome you back during our quieter afternoon hours!",
    },
  ];

  @override
  void initState() {
    super.initState();
    // Default closed
    _isReplyPanelOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'Manage Reviews', subtitle: 'All your reviews in one place'),
      body: Stack(
        children: [
          // Base layer: Review List
          Positioned.fill(
            child: Stack(
              children: [
                Column(
                  children: [
                    _buildFiltersAndSearch(),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 100),
                        itemCount: _reviews.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return _buildReviewCard(index, _reviews[index]);
                        },
                      ),
                    ),
                  ],
                ),
                if (_checkedReviews.isNotEmpty)
                  Positioned(bottom: 32, left: 0, right: 0, child: Center(child: _buildFloatingBulkActionBar())),
              ],
            ),
          ),
          
          // Dark Overlay
          if (_isReplyPanelOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isReplyPanelOpen = false;
                  });
                },
                child: AnimatedOpacity(
                  opacity: _isReplyPanelOpen ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
              ),
            ),
            
          // Sliding Right Panel
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            right: _isReplyPanelOpen ? 0 : -450,
            top: 0,
            bottom: 0,
            width: 450,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(-5, 0)),
                ],
              ),
              child: _buildRightDetailPanel(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersAndSearch() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search reviews...",
                    hintStyle: const TextStyle(color: AppColors.lightGrey, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: AppColors.lightGrey, size: 20),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.customBorderColorGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.storefront, size: 18, color: AppColors.primary),
                    SizedBox(width: 8),
                    CustomText("All Businesses (3 selected)", fontSize: 14, fontWeight: FontWeight.w600),
                    SizedBox(width: 16),
                    Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textSecondary),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.customBorderColorGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.swap_vert, size: 18, color: AppColors.textSecondary),
                    SizedBox(width: 8),
                    CustomText("Newest", fontSize: 14, fontWeight: FontWeight.w600),
                    SizedBox(width: 16),
                    Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip("All (256)", isSelected: true),
                const SizedBox(width: 12),
                _buildFilterChip("Replied (200)", dotColor: Colors.green),
                const SizedBox(width: 12),
                _buildFilterChip("Unanswered (56)", dotColor: Colors.red),
                const SizedBox(width: 12),
                _buildFilterChip("Needs Reply (56)", dotColor: Colors.blue),
                const SizedBox(width: 12),
                _buildFilterChip("Critical", dotColor: Colors.red),
                const SizedBox(width: 12),
                _buildFilterChip("5 Stars", icon: Icons.star_border),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false, Color? dotColor, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.white,
        border: Border.all(color: isSelected ? Colors.blue.shade200 : AppColors.customBorderColorGrey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dotColor != null) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
          ],
          if (icon != null) ...[Icon(icon, size: 16, color: AppColors.textSecondary), const SizedBox(width: 8)],
          CustomText(
            label,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.blue : AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(int index, Map<String, dynamic> review) {
    final bool isSelected = _selectedReviewIndex == index;
    final bool isChecked = _checkedReviews.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReviewIndex = index;
          _isReplyPanelOpen = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? Colors.blue : AppColors.customBorderColorGrey, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  if (val == true) {
                    _checkedReviews.add(index);
                  } else {
                    _checkedReviews.remove(index);
                  }
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              side: const BorderSide(color: AppColors.customBorderColorGrey),
              activeColor: Colors.blue,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: Colors.blue.shade600, shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: CustomText(review['initials'], fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(review['name'], fontSize: 16, fontWeight: FontWeight.bold),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: (review['badgeColor'] as Color).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: CustomText(
                                      review['badge'],
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: review['badgeColor'],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    starIndex < (review['rating'] as int) ? Icons.star : Icons.star_border,
                                    color: Colors.orange,
                                    size: 14,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(review['time'], fontSize: 13, isSecondary: true),
                          const SizedBox(width: 8),
                          const Icon(Icons.more_vert, size: 20, color: AppColors.textSecondary),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomText(review['text'], fontSize: 14, height: 1.5, color: const Color(0xFF333333)),
                  if (review['reply'] != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.customBorderColorGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText("Business Owner (You)", fontSize: 13, fontWeight: FontWeight.bold),
                              CustomText(review['time'], fontSize: 12, isSecondary: true),
                            ],
                          ),
                          const SizedBox(height: 8),
                          CustomText(review['reply'], fontSize: 13, height: 1.5, isSecondary: true),
                        ],
                      ),
                    ),
                  ],
                  if (review['reply'] == null) ...[
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedReviewIndex = index;
                              _isReplyPanelOpen = true;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            backgroundColor: review['badge'] == 'NEEDS REPLY' ? Colors.blue : Colors.white,
                            foregroundColor: review['badge'] == 'NEEDS REPLY' ? Colors.white : Colors.blue,
                          ),
                          icon: Icon(Icons.reply, size: 16, color: review['badge'] == 'NEEDS REPLY' ? Colors.white : Colors.blue),
                          label: CustomText(
                            "Reply",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: review['badge'] == 'NEEDS REPLY' ? Colors.white : Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _selectedReviewIndex = index;
                              _isReplyPanelOpen = true;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.customBorderColorGrey),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          icon: Icon(review['hasDraft'] ? Icons.auto_awesome : Icons.auto_awesome, size: 16, color: Colors.blue),
                          label: CustomText(
                            review['hasDraft'] ? "Draft Apology" : "Your IQ AI",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingBulkActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              setState(() {
                _checkedReviews.clear();
              });
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
          ),
          const SizedBox(width: 16),
          CustomText("${_checkedReviews.length} Selected", fontSize: 15, fontWeight: FontWeight.bold),
          const SizedBox(width: 24),
          Container(width: 1, height: 24, color: AppColors.customBorderColorGrey),
          const SizedBox(width: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const CustomText("Select all", fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade50,
              foregroundColor: Colors.blue,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            icon: const Icon(Icons.auto_awesome, size: 16),
            label: const CustomText("Bulk IQ AI Reply", fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 48),
          CustomTextButton(
            text: "Clear",
            onPressed: () {
              setState(() {
                _checkedReviews.clear();
              });
            },
            color: Colors.blue,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildRightDetailPanel() {
    if (_selectedReviewIndex == null) {
      return const Center(child: CustomText("Select a review to view details", isSecondary: true, fontSize: 14));
    }

    final review = _reviews[_selectedReviewIndex!];

   
    return Column(
      children: [
        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText("Selected Review Reply", fontSize: 20, fontWeight: FontWeight.bold),
                    IconButton(
                      icon: const Icon(Icons.close, color: AppColors.textSecondary),
                      onPressed: () {
                        setState(() {
                          _isReplyPanelOpen = false;
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const CustomText("Write and send replies to the selected review.", fontSize: 14, isSecondary: true),
                const SizedBox(height: 32),

                // Review Summary Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.customBorderColorGrey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: Colors.blue.shade600, shape: BoxShape.circle),
                                alignment: Alignment.center,
                                child: CustomText(review['initials'], fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(review['name'], fontSize: 16, fontWeight: FontWeight.bold),
                                      const SizedBox(width: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: (review['badgeColor'] as Color).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: CustomText(
                                          review['badge'],
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: review['badgeColor'],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      return Icon(
                                        starIndex < (review['rating'] as int) ? Icons.star : Icons.star_border,
                                        color: Colors.orange,
                                        size: 14,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomText(review['text'], fontSize: 14, height: 1.5, color: const Color(0xFF333333)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                const CustomText("Your Reply", fontSize: 16, fontWeight: FontWeight.bold),
                const SizedBox(height: 16),
                TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Write your reply...",
                    hintStyle: const TextStyle(color: AppColors.lightGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  controller: TextEditingController(
                    text:
                        "Hi David,\n\nThank you so much for your kind words! We're thrilled to hear you had a great experience and enjoyed the food and atmosphere. It means a lot to our team!\n\nWe look forward to welcoming you back again soon for another great lunch!\n\nBest regards,\nThe Main Branch Team",
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.customBorderColorGrey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.auto_awesome, size: 16, color: Colors.blue),
                  label: const CustomText("Sparkle AI Reply", fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue),
                ),
                const SizedBox(height: 24),
                const CustomText(
                  "This customer will be notified about your reply, and it will be publicly visible on Business Profile.",
                  fontSize: 12,
                  isSecondary: true,
                  height: 1.5,
                ),
              ],
            ),
          ),
        ),
        // Footer Actions
        Container(
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.customBorderColorGrey)),
          ),
          child: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  elevation: 0,
                ),
                icon: const Icon(Icons.send, size: 16),
                label: const CustomText("Post reply", fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.customBorderColorGrey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                child: const CustomText("Cancel", fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
