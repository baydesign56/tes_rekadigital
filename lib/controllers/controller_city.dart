import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tes_rekadigital/models/model_list_cuaca.dart';

class ControllerCity extends GetxController {
  bool load = true;
  String? errorMessage;
  List<ModelListCuaca> modelListCuaca = [];
  ModelListCuaca? selectCuaca;

  selectIndexCuaca(int index) {
    selectCuaca = modelListCuaca[index];
    update();
  }

  getCuca() async {
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
      ).get("https://ibnux.github.io/BMKG-importer/cuaca/501397.json");

      if (res.statusCode == 200) {
        modelListCuaca = modelListCuacaFromJson(res.data);
        selectCuaca = modelListCuaca[0];
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
