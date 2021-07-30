import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:onboard/model/onboardModel.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:onboard/views/login_screen.dart';

class OnboardController extends GetxController {
  var pageContoller = PageController();
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboard.length - 1;

  forwardAction() {
    if (isLastPage) {
      Get.to(AddIncome());
    } else {
      pageContoller.nextPage(duration: 3000.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardModel> onboard = <OnboardModel>[
    OnboardModel(
      ('images/note.png'),
      ('Record daily transcation'),
      ('Here note your daily income and loss safely and easily'),
    ),
    OnboardModel(
      ('images/view.png'),
      ('Analyze your record'),
      ('Find all your financial details in single place'),
    ),
    OnboardModel(
      ('images/bird.png'),
      ('Record daily transcation'),
      ('Keep eye on daily performence of your bird'),
    ),
  ];
}
