import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(Object context) {
    return Row(
      children: [
        Container(
          child: const Expanded(
            flex: 1,
            child: Text(
              "공공시설 수해 방지 플랫폼",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          child: Expanded(
            flex: 1,
            child: TimerBuilder.periodic(const Duration(seconds: 1),
                builder: (context) {
              // 1초마다 화면을 다시 그리고 현재 시간을 표시
              return Text(
                DateFormat('yyy-MM-d a h:mm s')
                    .format(DateTime.now()), // 현재 시간을 HH:mm:ss 형식으로 표시
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              );
            }),
          ),
        ),
      ],
    );
  }
}
