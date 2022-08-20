import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

import '../../main.dart';
import '../../views/post-auth/church.dart';
import '../../views/post-auth/individual.dart';

navigateAfterDelay(Widget widget) async {
  await Future.delayed(const Duration(seconds: 2));
  Get.to(widget);
}

navigateAndRemoveAfterDelay(Widget widget) async {
  await Future.delayed(const Duration(seconds: 2));
  Get.off(widget);
}

navigateAndRemoveAllAfterDelay(Widget widget) async {
  await Future.delayed(const Duration(seconds: 2));
  Get.offAll(widget);
}

navigateAfterFunction(Future<Function> function, Widget widget) async {
  await function;
  Get.to(widget);
}

navigateAndRemoveAfterFunction(Future<Function> function, Widget widget) async {
  await function;
  Get.off(widget);
}

navigateAndRemoveAllAfterFunction(
    Future<Function> function, Widget widget) async {
  await function;
  Get.offAll(widget);
}

navigate(dynamic widget) {
  Get.to(()=>widget);
}

navigateAndRemove(Widget widget) {
  Get.off(widget);
}

navigateAndRemoveAll(Widget widget) {
  Get.offAll(widget);
}

navigateRemoveAllGoHome(){
    Get.offAll(userType! == 0 ? const Individual() : const Church());

}

closeRoute() => Get.back();
