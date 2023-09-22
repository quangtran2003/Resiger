import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  RxBool checkSuffixIconData = true.obs;
  RxBool checkPassController = true.obs;
  RxBool fa = false.obs;
  void changeCheckPass(bool value) {
    if (value != null) {
      checkPassController.value = !checkPassController.value;
    }
  }

  void changeCheckSuffixIcon() {
    checkSuffixIconData.value = !checkPassController.value;
  }
}

// ignore: must_be_immutable
class TextFieldHomeScreen extends GetView<TextFieldController> {
  final getxController = Get.put(TextFieldController());
  String textHint;
  bool? checkPass;

  TextFieldHomeScreen({
    Key? key,
    required this.textHint,
    this.checkPass,
  }) : super(key: key);

  bool checkSuffixIcon = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => TextField(
          //cursorHeight: 40,
          obscureText: checkPass == null
              ? getxController.fa.value
              : getxController.checkPassController.value,
          decoration: InputDecoration(
              suffixIcon: checkPass == null
                  ? null
                  : controller.checkSuffixIconData.value
                      ? IconButton(
                          onPressed: () {
                            getxController.changeCheckSuffixIcon();
                            getxController.changeCheckPass(checkSuffixIcon);
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            getxController.changeCheckSuffixIcon();
                            getxController.changeCheckPass(checkSuffixIcon);
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
              hintText: textHint,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              fillColor: Colors.grey,
              enabledBorder: _buildBoderTextFiled(),
              errorBorder: _buildBoderTextFiled(),
              focusedBorder: _buildBoderTextFiled(),
              disabledBorder: _buildBoderTextFiled(),
              focusedErrorBorder: _buildBoderTextFiled()),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBoderTextFiled() {
    return OutlineInputBorder(
        // enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10));
  }
}
