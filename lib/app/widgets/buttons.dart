import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

enum ButtonState { idle, loading, success, error, warning }

class SubmitButtonController extends GetxController {
  final _buttonState = ButtonState.idle.obs;
  ButtonState get buttonState => _buttonState.value;
  set buttonState(ButtonState state) => _buttonState.value = state;

  final _isFormValid = false.obs;
  bool get isFormValid => _isFormValid.value;
  set isFormValid(bool state) => _isFormValid.value = state;

  late Worker _worker;

  @override
  void onInit() {
    super.onInit();
    _worker = ever(_buttonState, (ButtonState state) {
      if (state == ButtonState.success || state == ButtonState.error) {
        Future.delayed(
          Duration(seconds: 3),
          () => buttonState = ButtonState.idle,
        );
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _worker.dispose();
  }
}

class PrimaryButton extends GetView<SubmitButtonController> {
  final Function onPressed;
  final String text;

  PrimaryButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: controller.isFormValid &&
                controller.buttonState != ButtonState.loading
            ? () => onPressed()
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller.buttonState == ButtonState.loading &&
                controller.isFormValid)
              SizedBox(
                height: 18,
                child: FittedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              ),
            if (controller.buttonState == ButtonState.success)
              const Icon(Iconsax.tick_square),
            if (controller.buttonState == ButtonState.error)
              const Icon(Iconsax.info_circle),
            // const SizedBox(width: 20),
            // if (controller.buttonState == ButtonState.idle)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                controller.buttonState == ButtonState.loading
                    ? "Processing"
                    : controller.buttonState == ButtonState.error
                        ? "Error"
                        : controller.buttonState == ButtonState.success
                            ? "Success"
                            : text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  SecondaryButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
