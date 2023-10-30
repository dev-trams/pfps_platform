import 'package:flutter/material.dart';
import 'package:pfps_platform/Screen/Components/header.dart';

class MainScreen extends StatefulWidget {
  const MainScreen ({Key? key}) : super (key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Header(),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Container(

              ),
            ],
          ),
        ),
        Expanded(flex: 1,
            child: Container(

          ),
        ),
        Expanded(flex: 2,
          child: Container(

          ),
        ),
      ],
    );
  }
}