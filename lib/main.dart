```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController cityController = TextEditingController();

  String cityName = 'Murmansk Oblast, RU';

  final List<Map<String, dynamic>> weekWeather = [
    {'day': 'Friday', 'temp': '14°F', 'icon': Icons.ac_unit},
    {'day': 'Saturday', 'temp': '5°F', 'icon': Icons.cloud},
    {'day': 'Sunday', 'temp': '22°F', 'icon': Icons.sunny},
    {'day': 'Monday', 'temp': '18°F', 'icon': Icons.cloud},
    {'day': 'Tuesday', 'temp': '10°F', 'icon': Icons.ac_unit},
    {'day': 'Wednesday', 'temp': '25°F', 'icon': Icons.sunny},
    {'day': 'Thursday', 'temp': '20°F', 'icon': Icons.cloud},
  ];

  void searchCity() {
    if (cityController.text.trim().isNotEmpty) {
      setState(() {
        cityName = cityController.text.trim();
      });

      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // City input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: cityController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Enter City Name...',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: searchCity,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onSubmitted: (_) => searchCity(),
                ),
              ),

              SizedBox(height: 35),

              // City and date
              Column(
                children: [
                  Text(
                    cityName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Friday, Mar 20, 2020',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 35),

              // Current weather
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.ac_unit, size: 85, color: Colors.white),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Text(
                        '14°F',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'LIGHT SNOW',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 55),

              // Weather details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  weatherDetail(Icons.air, '5', 'km/h'),
                  weatherDetail(Icons.water_drop, '2', '%'),
                  weatherDetail(Icons.opacity, '20', '%'),
                ],
              ),

              SizedBox(height: 45),

              // Weekly forecast title
              Text(
                '7-DAY WEATHER FORECAST',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 20),

              // Horizontal carousel
              SizedBox(
                height: 145,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weekWeather.length,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    final weather = weekWeather[index];

                    return Container(
                      width: 125,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weather['day'],
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(
                            weather['icon'],
                            size: 42,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            weather['temp'],
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget weatherDetail(IconData icon, String value, String unit) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          unit,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}
```
