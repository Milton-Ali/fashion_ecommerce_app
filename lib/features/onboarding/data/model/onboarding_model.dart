import 'package:fashion_ecommerce_app/features/onboarding/domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  const OnboardingModel({required super.title, required super.description});
  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
