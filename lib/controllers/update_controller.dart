import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/services/http_service.dart';

import 'home_controller.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;
  var titleTextEditingController = TextEditingController().obs;
  var bodyTextEditingController = TextEditingController().obs;
  final _homeController = Get.put(HomeController());

  apiPostUpdate(BuildContext context) async {
    isLoading(true);

    Post post = Post(id: Random().nextInt(pow(2, 30) - 1),title: titleTextEditingController().text, body: bodyTextEditingController().text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.PUT(Network.API_UPDATE + '1', Network.paramsUpdate(post));

    if (response != null) {
      Navigator.of(context).pop();
      _homeController.apiPostList();
    }

    isLoading(false);
  }
}