import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tes_rekadigital/controllers/controller_city.dart';
import 'package:tes_rekadigital/models/model_list_cuaca.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControllerCity controllerCity = Get.put(ControllerCity());

  @override
  void initState() {
    super.initState();
    controllerCity.getCuca();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCity>(builder: (value) {
      return value.load
          ? const Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator()))
          : value.errorMessage == null
              ? Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.blue,
                            child: Column(children: [
                              const SizedBox(
                                height: 50,
                              ),
                              GetBuilder<ControllerCity>(builder: (value) {
                                return value.selectCuaca == null
                                    ? const SizedBox(
                                        width: 0,
                                        height: 0,
                                      )
                                    : top(value.selectCuaca!);
                              }),
                              const SizedBox(
                                height: 90,
                              ),
                              wavew(),
                            ]),
                          ),
                          GetBuilder<ControllerCity>(builder: (value) {
                            return Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Hari ini",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 2,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 15),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Besok",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 2,
                                              color: Colors.transparent,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          for (var i = 0;
                                              i < value.modelListCuaca.length;
                                              i++)
                                            GestureDetector(
                                              onTap: () {
                                                value.selectIndexCuaca(i);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 20),
                                                color: Colors.transparent,
                                                child: Column(children: [
                                                  Text(
                                                    value.modelListCuaca[i]
                                                            .jamCuaca!.hour
                                                            .toString() +
                                                        " : " +
                                                        value.modelListCuaca[i]
                                                            .jamCuaca!.minute
                                                            .toString(),
                                                  ),
                                                  const SizedBox(height: 30),
                                                  const Icon(
                                                    Icons.cloud_outlined,
                                                    size: 40,
                                                  ),
                                                  const SizedBox(height: 30),
                                                  Text(
                                                    value.modelListCuaca[i]
                                                            .tempC! +
                                                        "\u00B0",
                                                    style: const TextStyle(),
                                                  ),
                                                ]),
                                              ),
                                            )
                                        ],
                                      )),
                                ],
                              ),
                            );
                          }),
                        ]),
                  ),
                )
              : Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(value.errorMessage ?? "error"),
                      TextButton(
                          onPressed: () {
                            value.getCuca();
                          },
                          child: const Text("reload"))
                    ],
                  )));
    });
  }
}

Widget top(ModelListCuaca cuaca) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Aceh",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.arrow_drop_down, color: Colors.white)
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      const Text("Kota Banda Aceh",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          )),
      const SizedBox(
        height: 30,
      ),
      Text(
        cuaca.tempC.toString() + "\u00B0",
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
      const Icon(
        Icons.cloud,
        color: Colors.white,
        size: 90,
      ),
    ],
  );
}

Widget wavew() {
  return Container(
    width: Get.width,
    height: 50,
    color: Colors.transparent,
    child: WaveWidget(
      config: CustomConfig(
        colors: [
          Colors.white,
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.7),
        ],
        durations: [5000, 6000, 7000],
        heightPercentages: [0.02, 0.2, 0.2],
        //height percentage for each colors.
        blur: const MaskFilter.blur(BlurStyle.solid, 5),
        //blur intensity for waves
      ),
      waveAmplitude: 35.00, //depth of curves
      waveFrequency: 3, //number of curves in waves
      backgroundColor: Colors.transparent, //background colors
      size: const Size(
        double.infinity,
        double.infinity,
      ),
    ),
  );
}
