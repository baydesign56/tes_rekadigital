// To parse this JSON data, do
//
//     final modelListCIty = modelListCItyFromJson(jsonString);

import 'dart:convert';

List<ModelListCIty> modelListCItyFromJson(String str) =>
    List<ModelListCIty>.from(
        json.decode(str).map((x) => ModelListCIty.fromJson(x)));

String modelListCItyToJson(List<ModelListCIty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelListCIty {
  ModelListCIty({
    this.id,
    this.propinsi,
    this.kota,
    this.kecamatan,
    this.lat,
    this.lon,
  });

  String? id;
  String? propinsi;
  String? kota;
  String? kecamatan;
  String? lat;
  String? lon;

  factory ModelListCIty.fromJson(Map<String, dynamic> json) => ModelListCIty(
        id: json["id"],
        propinsi: json["propinsi"],
        kota: json["kota"],
        kecamatan: json["kecamatan"],
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "propinsi": propinsi,
        "kota": kota,
        "kecamatan": kecamatan,
        "lat": lat,
        "lon": lon,
      };
}
