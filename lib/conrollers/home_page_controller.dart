

import 'package:get/get.dart';

class HomePageController extends GetxController{
  final count = 0.obs;

  incriment(){
    count.value ++;
  }

}