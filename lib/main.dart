import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resiger/homescreen/textFieldHomeScreen.dart';
import 'package:resiger/resiger/resigerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHome(),
      //  initialRoute: 'ScreenResiger',
      routes: {'ScreenResiger': (context) => ScreenResiger()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatelessWidget {
  MyHome({super.key});

  List<Itemm> girdView = [
    Itemm(
        color: Colors.blue, icondata: Icons.facebook, colorItem: Colors.white),
    Itemm(
        color: Colors.white,
        icondata: Icons.g_mobiledata_outlined,
        colorItem: Colors.green),
    Itemm(
      color: Colors.grey,
      icondata: Icons.apple,
      colorItem: Colors.black87,
    ),
    Itemm(
      color: Colors.green,
      icondata: Icons.wechat,
      colorItem: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.height;
    // var y = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            //color: Colors.white70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Container(
                height: x / 4,
                width: double.infinity,

                // color: Colors.blue,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(image: AssetImage('assets/1.png'))),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Account login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              TextFieldHomeScreen(
                textHint: 'Email / Phone / Team Model ID',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldHomeScreen(
                textHint: 'Password',
                checkPass: true,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('ScreenResiger');
                    },
                    child: const Text(
                      'Resiger',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Forget password',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'More opptions',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 2.5),
                  itemCount: girdView.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildgridView(girdView[index]);
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Container _buildgridView(Itemm item) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.2), // Màu và độ trong suốt của bóng
            spreadRadius: 2, // Độ lan tỏa của bóng
            blurRadius: 5, // Độ mờ của bóng
            offset: Offset(0, 3), // Độ dịch chuyển ngang và dọc của bóng
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            item.icondata,
            color: item.colorItem,
            size: 30,
          )),
    );
  }
}

class Itemm {
  Color color;
  IconData icondata;
  Color colorItem;
  Itemm({
    required this.color,
    required this.icondata,
    required this.colorItem,
  });
}
