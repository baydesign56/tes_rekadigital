import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_rekadigital/controllers/controller_cuaca.dart';
import 'package:tes_rekadigital/models/model_list_city.dart';

class ControllerCity extends GetxController {
  bool load = false;
  String? errorMessage;
  List<ModelListCIty>? modelListCity;
  ModelListCIty? selectedCity;
  ControllerCuaca controllerCuaca = Get.put(ControllerCuaca());

  selec(ModelListCIty select) {
    selectedCity = select;
    controllerCuaca.getCuca(selectedCity!.id.toString());
    if (Get.isBottomSheetOpen == true) Get.back();
    update();
  }

  getCity() async {
    load = true;
    errorMessage = null;
    update();

    try {
      var res = await Dio(
        BaseOptions(
          sendTimeout: 8000,
          connectTimeout: 8000,
          receiveTimeout: 8000,
          responseType: ResponseType.plain,
        ),
      ).get("https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json");

      if (res.statusCode == 200) {
        modelListCity = modelListCItyFromJson(res.data);
        selectedCity = modelListCity![0];
        controllerCuaca.getCuca(selectedCity!.id.toString());
        load = false;
        log(res.data);
        update();
      } else {
        errorMessage = "Error " + res.statusCode.toString();
        load = false;
        log(res.statusCode.toString());
        update();
      }
    } on DioError catch (e) {
      load = false;
      errorMessage = e.message;
      log(e.message);

      update();
    }
  }
}
