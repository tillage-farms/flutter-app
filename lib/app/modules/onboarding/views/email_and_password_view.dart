import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tillage_farms/app/modules/onboarding/controllers/auth_controller.dart';

class EmailAndPassword extends GetView<AuthController> {
  const EmailAndPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back,',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4BB547),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Please log in to your account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: controller.emailTextEditingController,
                initialValue: controller.email,
                onChanged: (value) => controller.email = value,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4BB547),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4BB547),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4BB547),
                    ),
                  ),
                  hintText: "Enter email address",
                  hintStyle: TextStyle(
                    color: Color(0xFF4BB547),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: controller.passwordTextEditingController,
                initialValue: controller.password,
                onChanged: (value) => controller.password = value,
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: Icon(
                    Iconsax.eye,
                    color: Color(0xFF4BB547),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4BB547),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4BB547),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4BB547),
                    ),
                  ),
                  hintText: "Enter email address",
                  hintStyle: TextStyle(
                    color: Color(0xFF4BB547),
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "I forgot my password",
                      style: TextStyle(
                        color: Color(0xFF4BB547),
                        fontSize: 20,
                        // fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "I forgot my password",
                      style: TextStyle(
                        color: Color(0xFF4BB547),
                        fontSize: 20,
                        // fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
