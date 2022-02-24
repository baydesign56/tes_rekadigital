// To parse this JSON data, do
//
//     final modelListCuaca = modelListCuacaFromJson(jsonString);

import 'dart:convert';

List<ModelListCuaca> modelListCuacaFromJson(String str) =>
    List<ModelListCuaca>.from(
        json.decode(str).map((x) => ModelListCuaca.fromJson(x)));

String modelListCuacaToJson(List<ModelListCuaca> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelListCuaca {
  ModelListCuaca({
    this.jamCuaca,
    this.kodeCuaca,
    this.cuaca,
    this.humidity,
    this.tempC,
    this.tempF,
  });

  DateTime? jamCuaca;
  String? kodeCuaca;
  String? cuaca;
  String? humidity;
  String? tempC;
  String? tempF;

  factory ModelListCuaca.fromJson(Map<String, dynamic> json) => ModelListCuaca(
        jamCuaca: DateTime.parse(json["jamCuaca"]),
        kodeCuaca: json["kodeCuaca"],
        cuaca: json["cuaca"],
        humidity: json["humidity"],
        tempC: json["tempC"],
        tempF: json["tempF"],
      );

  Map<String, dynamic> toJson() => {
        "jamCuaca": jamCuaca!.toIso8601String(),
        "kodeCuaca": kodeCuaca,
        "cuaca": cuaca,
        "humidity": humidity,
        "tempC": tempC,
        "tempF": tempF,
      };
}
