// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../conrollers/home_page_controller.dart';

class Home extends StatelessWidget {
  final String? title;

  // initializing the controller
  final HomePageController controller = Get.put(HomePageController());

  Home({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title as String),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Obx uses stream so every time the variable count changes it will render it
            Obx(
              () => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incriment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
