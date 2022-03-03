import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_rekadigital/controllers/controller_city.dart';
import 'package:tes_rekadigital/controllers/controller_cuaca.dart';

import '../list_city.dart';
import 'list_cuaca.dart';

Widget top() {
  return GetBuilder<ControllerCuaca>(builder: (value) {
    var cuaca = value.selectCuaca;
    return GetBuilder<ControllerCity>(builder: (value2) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              Get.bottomSheet(const ListCity());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value2.selectedCity!.kecamatan!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(value2.selectedCity!.kota!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              )),
          const SizedBox(
            height: 30,
          ),
          Text(
            cuaca!.tempC.toString() + "\u00B0",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 80,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            cuaca.jamCuaca!.day.toString() +
                "-" +
                cuaca.jamCuaca!.month.toString() +
                "-" +
                cuaca.jamCuaca!.year.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            cuaca.cuaca!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          iconCuaca(cuaca, size: 60, color: Colors.white)
        ],
      );
    });
  });
}
