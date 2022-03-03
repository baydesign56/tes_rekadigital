import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_rekadigital/controllers/controller_city.dart';

class ListCity extends StatefulWidget {
  const ListCity({Key? key}) : super(key: key);

  @override
  _ListCityState createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GetBuilder<ControllerCity>(
        builder: (value) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    for (var item in value.modelListCity!)
                      InkWell(
                        onTap: () {
                          value.selec(item);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(7.5),
                          decoration: BoxDecoration(
                            color: item == value.selectedCity
                                ? Colors.blue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          padding: const EdgeInsets.all(7.5),
                          child: Text(
                            item.kecamatan ?? "kota",
                            style: TextStyle(
                              color: item == value.selectedCity
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
