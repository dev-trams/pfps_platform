import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pfps_platform/Screen/Components/header.dart';
import 'package:pfps_platform/Screen/Components/view_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Header(),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < 9; i++)
                          const SizedBox(width: 200, child: ViewCard()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: FlutterMap(
                      options: const MapOptions(
                        center: LatLng(37.508883, 127.100015),
                        zoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'com.ctrls.ipms.parkshare.parkshare',
                        ),
                        const MarkerLayer(markers: [
                          Marker(
                            point: LatLng(37.508883, 127.100015),
                            child: Icon(Icons.yard),
                          ),
                          Marker(
                            point: LatLng(37.518783, 127.100015),
                            child: Icon(Icons.yard),
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '번호',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '위치이름',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '수위',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '온도',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '습도',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'IP주소',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '상태',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '조치',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: ListView.builder(
                              itemBuilder: (context, index) => ListTile(
                                title: Row(
                                  children: [
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("data$index")),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle listViewTitleStyle() {
  return const TextStyle(
    height: 3.0,
    fontSize: 15.2,
    fontWeight: FontWeight.bold,
  );
}
