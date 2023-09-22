import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resiger/homescreen/textFieldHomeScreen.dart';

class RadioController extends GetxController {
  var check = 0.obs;
  void checkRadio(int radio) {
    check.value = radio;
  }

  void checkCellphoneEmail(int value) {
    if (value == 0) {
      check.value = 1;
    } else {
      check.value = 0;
    }
  }
}

class ScreenResiger extends GetView<RadioController> {
  final getxcontroller = Get.put(RadioController());
  ScreenResiger({super.key});
  int radio = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 80,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/2.png'))),
              ),
              const Center(
                child: Text(
                  'CREATE COUNT',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    _buildPadingText("Acount"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => RadioListTile(
                              value: 0,
                              groupValue: getxcontroller.check.value,
                              onChanged: (radio) {
                                getxcontroller.checkRadio(radio!);
                                if (radio != 0) {
                                  getxcontroller.checkCellphoneEmail(radio);
                                }
                              },
                              title: const Text('Cellphone'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => RadioListTile(
                              value: 1,
                              groupValue: getxcontroller.check.value,
                              onChanged: (radio) {
                                getxcontroller.checkRadio(radio!);
                                if (radio != 1) {
                                  getxcontroller.checkCellphoneEmail(radio);
                                }
                              },
                              title: const Text('Email'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Obx(() => getxcontroller.check == 0
                        ? _buildinputCellphone()
                        : TextFieldHomeScreen(
                            textHint: 'Please enter your Email')),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.black),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Send code'),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1)),
                                child: TextFieldHomeScreen(
                                    textHint: 'Enter code')))
                      ],
                    ),
                    _buildPadingText('Name'),
                    TextFieldHomeScreen(
                      textHint: '',
                    ),
                    _buildPadingText(
                      'Password',
                    ),
                    TextFieldHomeScreen(textHint: '', checkPass: true),
                    _buildPadingText('Comfrim'),
                    TextFieldHomeScreen(
                      textHint: '',
                      checkPass: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 5, right: 10),
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(width: 1))),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                softWrap: true,
                                text: const TextSpan(
                                    style: TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.visible),
                                    children: [
                                      TextSpan(
                                          text:
                                              'Registation means that you have read and \nagreed to the',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: ' teams of service',
                                          style: TextStyle(color: Colors.blue)),
                                      TextSpan(
                                          text: ' and',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: ' privacy \npolicy',
                                          style: TextStyle(color: Colors.blue))
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue),
                        child: const Center(
                          child: Text(
                            'Resiger',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Row _buildinputCellphone() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1, style: BorderStyle.solid, color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('+84'),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                ],
              ),
            )),
        SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 3,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1)),
                child: TextFieldHomeScreen(
                    textHint: 'Please enter your Cellphone')))
      ],
    );
  }

  Padding _buildPadingText(String textPading) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5, right: 15, left: 15),
            child: Icon(
              Icons.star,
              color: Colors.red,
              size: 10,
            ),
          ),
          Text(
            textPading,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
