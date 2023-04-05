import 'package:clima/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clima/components/forecast_card.dart';
import 'package:clima/components/triple_card.dart';
import 'package:clima/style.dart';

class WheaterPage extends StatefulWidget {
  dynamic weatherData;
  dynamic weatherDataForecast;

  WheaterPage(
      {Key? key, required this.weatherData, required this.weatherDataForecast})
      : super(key: key);

  @override
  State<WheaterPage> createState() => _WheaterPageState();
}

class _WheaterPageState extends State<WheaterPage> {
  late dynamic temp;
  late dynamic weather;
  late dynamic wind;
  late int visibility;
  late String cityName;
  late Color tempColor;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temp = 0;
          cityName = '';
          weather = [];
          visibility = 0;
          tempColor = ClimaColors.random();
        }
        weather = weatherData['weather'];
        temp = weatherData['main'];
        wind = weatherData['wind'];
        cityName = weatherData['name'];
        visibility = weatherData['visibility'];
        tempColor = ClimaColors.basedOnTemp(weatherData['main']['temp']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          cityName,
          style: TextStyles.title1,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadingPage(
                    bgColor: ClimaColors.random(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        color: tempColor,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Center(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: Text(weekDayMounth(),
                              style:
                                  TextStyles.title2.copyWith(color: tempColor)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          weather[0]['description'],
                          style: TextStyles.h3,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${temp['temp'].toStringAsFixed(0)}°',
                          style:
                              TextStyles.display.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Daily summary', style: TextStyles.h2),
                      SizedBox(height: 6),
                      Text(
                        'Now it feels like ${temp['feels_like'].toStringAsFixed(0)}°, acutal temperature is ${temp['temp'].toStringAsFixed(0)}°. \n'
                        'the temperature is in the range of ${temp['temp_min'].toStringAsFixed(0)}° - ${temp['temp_max'].toStringAsFixed(0)}°.',
                        style: TextStyles.body1,
                      ),
                      SizedBox(height: 22),
                      TripleCard(
                          wind: wind,
                          temp: temp,
                          visibility: visibility,
                          tempColor: tempColor),
                    ],
                  ),
                ),
                Text(
                  'Weekly forecast',
                  style: TextStyles.h2,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ForeCastCard(
                      pastDays: 1,
                      forecast: widget.weatherDataForecast['list'][0],
                    ),
                    ForeCastCard(
                      pastDays: 2,
                      forecast: widget.weatherDataForecast['list'][1],
                    ),
                    ForeCastCard(
                      pastDays: 3,
                      forecast: widget.weatherDataForecast['list'][2],
                    ),
                    ForeCastCard(
                      pastDays: 4,
                      forecast: widget.weatherDataForecast['list'][3],
                    ),
                  ],
                ),
                SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }

  String weekDayMounth() {
    return '${DateFormat.EEEE().format(
      DateTime.now(),
    )}, ${DateFormat.d().format(
      DateTime.now(),
    )} ${DateFormat.MMM().format(
      DateTime.now(),
    )}';
  }
}
