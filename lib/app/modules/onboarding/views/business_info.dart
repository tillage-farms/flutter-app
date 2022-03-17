import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/onboarding_controller.dart';

class BusinessInfoView extends GetView<OnboardingController> {
  const BusinessInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.nameTextEditingController,
            onChanged: (value) {
              controller.businessProfile.update((businessProfileDTO) {
                businessProfileDTO?.name = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Business Name",
              labelText: "Business Name",
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: controller.industryTextEditingController,
            onChanged: (value) {
              controller.businessProfile.update((businessProfileDTO) {
                businessProfileDTO?.industry = value;
              });
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Iconsax.arrow_down_1),
              labelText: "Industry",
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: controller.phoneNumberTextEditingController,
            onChanged: (value) {
              controller.businessProfile.update((businessProfileDTO) {
                businessProfileDTO?.phoneNumber = value;
              });
            },
            decoration: InputDecoration(
              labelText: "Phone Number",
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
