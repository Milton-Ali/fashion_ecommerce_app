import 'package:fashion_ecommerce_app/core/constants/sizes.dart';
import 'package:fashion_ecommerce_app/core/constants/text_style.dart';
import 'package:fashion_ecommerce_app/features/onboarding/data/onboarding_data.dart';
import 'package:fashion_ecommerce_app/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _pageController.jumpToPage(onboardingData.length - 1);
                },
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.heading,
                        ),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.body,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            OnboardingIndicator(
              currentPage: currentPage,
              pageCount: onboardingData.length,
            ),
            SizedBox(height: AppSizes.lg),
            SizedBox(
              height: 30,
              width: 140,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPage == 2) {
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
