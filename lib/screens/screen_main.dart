import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pfps_platform/models/model_core.dart';
import 'package:pfps_platform/screens/header.dart';
import 'package:pfps_platform/screens/screen_verification.dart';
import 'package:pfps_platform/screens/view_card.dart';
import 'package:pfps_platform/services/networks/network_core.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String deviceName = '';
  String licenses = '';
  String barrierValue = '0';
  double waterValue = 0.0;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(),
        backgroundColor: const Color(0xFF1C2D4E),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: viewListTitleText(title: '기종'),
                      ),
                      Expanded(
                        flex: 2,
                        child: viewListTitleText(title: '위치이름'),
                      ),
                      Expanded(
                        child: viewListTitleText(title: '수위'),
                      ),
                      Expanded(
                        child: viewListTitleText(title: '상태'),
                      ),
                      Expanded(
                        child: viewListTitleText(title: '조치'),
                      ),
                      Expanded(
                        child: viewListTitleText(title: ''),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: CoreNetwork().fetchCoreData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done ||
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          print(
                              'snapshot hasdata is ${snapshot.hasData} | ConnectionState is ${snapshot.connectionState}');
                          final dataSet = snapshot.data!;
                          return mainListView(snapshot, dataSet);
                        } else if (snapshot.hasError) {
                          // 데이터 로드 중 오류가 발생한 경우
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 40,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '데이터를 불러오는 도중 오류가 발생했습니다.',
                                  style: TextStyle(color: Colors.red),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // 재시도 버튼 클릭 시 다시 데이터를 가져오도록 함
                                    setState(() {});
                                  },
                                  child: const Text('다시 시도'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          print(
                              'snapshot hasdata is ${snapshot.hasData} | ConnectionState is ${snapshot.connectionState}');
                          return SpinKitWaveSpinner(
                            waveColor: Colors.blue.shade200,
                            color: Colors.blue,
                            size: 100,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: deviceName.isNotEmpty
                        ? ViewCard(
                            index: _index,
                          )
                        : SpinKitWaveSpinner(
                            waveColor: Colors.blue.shade200,
                            color: Colors.blue,
                            size: 100,
                          )),
              ),
              Expanded(
                child: Card(
                  child: SizedBox(
                    height: 140,
                    child: Column(
                      children: [
                        const Text(
                          '경보 조치',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.green.shade300,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: onWaringButton(context),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: waring(barrierValue),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  ListView mainListView(
      AsyncSnapshot<List<CoreClient>> snapshot, List<CoreClient> dataSet) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          setState(() {});
          deviceName = dataSet[index].device_id;
          waterValue = double.parse(dataSet[index].water_value);
          barrierValue = dataSet[index].barrier_value;
          _index = index;
        },
        title: Row(
          children: [
            Expanded(
              child: Text(
                dataSet[index].device_id,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                dataSet[index].address == "" ? '위치없음' : dataSet[index].address,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                convertWaterValue(double.parse(dataSet[index].water_value)),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                stateChange(
                    convertWaterValue(double.parse(dataSet[index].water_value))
                        .toString()),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                dataSet[index].barrier_value != '0' ? 'ON' : "OFF",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(
                            license: dataSet[index].license, index: index),
                      ),
                    );
                    print('select key [${dataSet[index].license}]');
                  },
                  child: const Text(
                    '상세',
                    style: TextStyle(fontSize: 14),
                  )),
            )
          ],
        ),
      ),
    );
  }

  TextButton onWaringButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        CoreNetwork()
            .onWaring(
          deviceName: deviceName.toLowerCase(),
        )
            .then(
          (value) {
            showModalBottomSheet(
              context: context,
              builder: (context) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  '경보가 발령되었습니다.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        );
      },
      child: const Text(
        '경보',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Text viewListTitleText({required String title}) {
    return Text(
      title,
      style: listViewTitleStyle(),
      textAlign: TextAlign.center,
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

String stateChange(String data) {
  if (double.parse(data) > 15.0) {
    return '비상';
  } else if (double.parse(data) <= 15.0 && double.parse(data) > 10.0) {
    return '주의';
  } else if (double.parse(data) <= 10.0 && double.parse(data) > 0.0) {
    return '평시';
  } else if (double.parse(data) > -1000.0) {
    return '평시';
  }
  return '초비상!';
}

Color waring(String snapshot) {
  print(snapshot);
  return snapshot == '0' ? Colors.blue : Colors.red;
}

String convertWaterValue(double value) {
  double maxValue = 15.0;
  value = value > -1 ? (maxValue - value) : 0;

  return value.toStringAsFixed(2);
}
