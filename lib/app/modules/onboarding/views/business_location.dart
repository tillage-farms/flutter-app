import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:tillage_farms/app/theme/core/values/colors.dart';

class BusinessLocationView extends GetView<OnboardingController> {
  const BusinessLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_circle_left,
            color: AppColors.primaryAccentColor,
            size: 32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.homeAddressTextEditingController,
              onChanged: (value) {
                controller.businessProfile.update((businessProfileDTO) {
                  businessProfileDTO?.homeAddress = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Home Address",
                labelText: "Home Address",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: controller.countryTextEditingController,
              onChanged: (value) {
                controller.businessProfile.update((businessProfileDTO) {
                  businessProfileDTO?.country = value;
                });
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Iconsax.arrow_down),
                hintText: "Select Country",
                labelText: "Select Country",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: controller.regionTextEditingController,
              onChanged: (value) {
                controller.businessProfile.update((businessProfileDTO) {
                  businessProfileDTO?.region = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter Region",
                labelText: "Enter Region",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: controller.cityTextEditingController,
              onChanged: (value) {
                controller.businessProfile.update((businessProfileDTO) {
                  businessProfileDTO?.city = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter City",
                labelText: "Enter City",
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
