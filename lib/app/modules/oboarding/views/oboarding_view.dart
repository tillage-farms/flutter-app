import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/oboarding_controller.dart';

class OboardingView extends GetView<OboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OboardingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OboardingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
