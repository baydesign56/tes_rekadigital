import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tes_rekadigital/models/model_list_cuaca.dart';

Widget listCuaca(ModelListCuaca value) {
  return Container(
    margin: const EdgeInsets.only(right: 20, top: 20),
    color: Colors.transparent,
    child: Column(children: [
      Text(
        value.jamCuaca!.hour.toString() +
            " : " +
            value.jamCuaca!.minute.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 30),
      iconCuaca(value, color: Colors.black26),
      const SizedBox(height: 30),
      Text(
        value.tempC! + "\u00B0",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]),
  );
}

Icon iconCuaca(ModelListCuaca cuaca,
    {Color? color = Colors.black, double? size = 40}) {
  switch (cuaca.cuaca) {
    case "Cerah Berawan":
      return Icon(
        Icons.brightness_6_outlined,
        size: size,
        color: color,
      );
    case "Berawan":
      return Icon(
        Icons.cloud_outlined,
        size: size,
        color: color,
      );
    case "Hujan Ringan":
      return Icon(
        Icons.grain,
        size: size,
        color: color,
      );
  }
  return Icon(
    Icons.cloud,
    size: size,
    color: color,
  );
}
