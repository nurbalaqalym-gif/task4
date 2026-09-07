import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text('Weather Forecast', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _enter(),
        SizedBox(height: 30),
        _city(),
        SizedBox(height: 30),
        _sunny(),
        SizedBox(height: 60),
        _icons(),
        SizedBox(height: 40),
        _text(),
        SizedBox(height: 40),
        _week(),
      ],
    ),
  );
}

Row _enter() {
  return Row(
    children: [
      Icon(Icons.search, color: Colors.white, size: 20),
      Text(
        'Enter City Name...',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ],
  );
}

Column _city() {
  return Column(
    children: [
      Text(
        'Murmansk Oblast, RU',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      Text(
        'Friday, Mar 20, 2020',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ],
  );
}

Row _sunny() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.sunny, size: 90, color: Colors.white),
      Column(
        children: [
          Text('14 ºF', style: TextStyle(fontSize: 50, color: Colors.white)),
          Text(
            'LIGHT SNOW',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

Row _icons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.ac_unit, color: Colors.white),
          Text('5', style: TextStyle(color: Colors.white)),
          Text('km/h', style: TextStyle(color: Colors.white)),
        ],
      ),
      Column(
        children: [
          Icon(Icons.ac_unit, color: Colors.white),
          Text('2', style: TextStyle(color: Colors.white)),
          Text('%', style: TextStyle(color: Colors.white)),
        ],
      ),
      Column(
        children: [
          Icon(Icons.ac_unit, color: Colors.white),
          Text('20', style: TextStyle(color: Colors.white)),
          Text('%', style: TextStyle(color: Colors.white)),
        ],
      ),
    ],
  );
}

Text _text() {
  return Text(
    '7-DAY WEATHER FORECAST',
    style: TextStyle(fontSize: 20, color: Colors.white),
  );
}

Row _week() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        color: Colors.white30,
        width: 80,
        height: 100,
        child: Column(
          children: [
            Text('ay', style: TextStyle(fontSize: 20, color: Colors.white)),
            Icon(Icons.sunny, size: 50, color: Colors.white),
          ],
        ),
      ),
      Container(
        color: Colors.white30,
        width: 150,
        height: 100,
        child: Column(
          children: [
            Text(
              'Saturday',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '5 ºF',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Icon(Icons.sunny, size: 50, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white30,
        width: 130,
        height: 100,
        child: Column(
          children: [
            Text('Sunday', style: TextStyle(fontSize: 20, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '22 ºF',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Icon(Icons.sunny, size: 50, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
