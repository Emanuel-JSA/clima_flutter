import 'package:clima/services/wheater_data.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'wheater_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  Color bgColor;

  LoadingPage({required this.bgColor, Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Position position = await Location.determinePosition();
    double latitude = position.latitude;
    double longitude = position.longitude;

    WheaterData wheaterData = WheaterData(latitude: latitude, longitude: longitude);

    var data = await wheaterData.getData();
    var dataForeCast = await wheaterData.getForecastData();
    pushWheaterPage(data, dataForeCast);
  }

  void pushWheaterPage(data, dataForeCast) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WheaterPage(
          weatherData: data,
          weatherDataForecast: dataForeCast,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.bgColor,
        child: const Center(
          child: SpinKitPulse(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
