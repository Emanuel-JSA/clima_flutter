import 'package:flutter/material.dart';
import '../style.dart';

class TripleCard extends StatelessWidget {
  const TripleCard({
    super.key,
    required this.wind, required this.tempColor, required this.temp, required this.visibility,
  });

  final int visibility;
  final dynamic temp;
  final Color tempColor;
  final dynamic wind;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.air,
                color: tempColor,
                size: 36.0,
              ),
              SizedBox(height: 8.0,),
              Text(
                '${(wind['speed'] * 3.6).round()}km/h',
                style: TextStyles.h3.copyWith(color: tempColor),
              ),
              SizedBox(height: 4.0,),
              Text(
                'Wind',
                style: TextStyles.body1.copyWith(color: tempColor),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.water_drop_outlined,
                color: tempColor,
                size: 36.0,
              ),
              SizedBox(height: 8.0,),
              Text(
                '${temp['humidity']}%',
                style: TextStyles.h3.copyWith(color: tempColor),
              ),
              SizedBox(height: 4.0,),
              Text(
                'Humidity',
                style: TextStyles.body1.copyWith(color: tempColor),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.access_alarms_outlined,
                color: tempColor,
                size: 36.0,
              ),
              SizedBox(height: 8.0,),
              Text(
                '${visibility/1000}km',
                style: TextStyles.h3.copyWith(color: tempColor),
              ),
              SizedBox(height: 4.0,),
              Text(
                'Visibility',
                style: TextStyles.body1.copyWith(color: tempColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}