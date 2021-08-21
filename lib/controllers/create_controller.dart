import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;
  var titleTextEditingController = TextEditingController().obs;
  var bodyTextEditingController = TextEditingController().obs;
  final _homeController = Get.put(HomeController());

  apiPostCreate(BuildContext context)  async {
    isLoading(true);

    Post post = Post(title: titleTextEditingController().text, body: bodyTextEditingController().text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.GET(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.of(context).pop();
      _homeController.apiPostList();
      titleTextEditingController().text = '';
      bodyTextEditingController().text = '';

    }

    isLoading(false);
  }
}