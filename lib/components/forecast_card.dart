import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';
import '../style.dart';

class ForeCastCard extends StatelessWidget {
  const ForeCastCard({
    super.key,
    required this.pastDays,
    required this.forecast,
  });

  final int pastDays;
  final dynamic forecast;

  dayMounth() {
    return '${DateFormat.d().format(
      DateTime.now().add(
        Duration(days: pastDays),
      ),
    )} ${DateFormat.MMM().format(
      DateTime.now().add(
        Duration(days: pastDays),
      ),
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              Text(
                '${forecast['main']['temp'].toStringAsFixed(0)}°',
                style: TextStyles.h3,
              ),
              SizedBox(
                height: 6.0,
              ),
              Icon(
                getIcon(forecast['weather'][0]['icon']),
                size: 36.0,
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                dayMounth(),
                style: TextStyles.h3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData? getIcon(forecast) {
    if (forecast.startsWith('01')) return Icons.wb_sunny;
    if (forecast.startsWith('02')) return MdiIcons.weatherPartlyCloudy;
    if (forecast.startsWith('03')) return Icons.cloud_outlined;
    if (forecast.startsWith('04')) return Icons.cloud;
    if (forecast.startsWith('09')) return MdiIcons.weatherRainy;
    if (forecast.startsWith('10')) return MdiIcons.weatherRainy;
    if (forecast.startsWith('11')) return Icons.bolt;
    if (forecast.startsWith('13')) return Icons.ac_unit;
    if (forecast.startsWith('50')) return Icons.waves_rounded;
  }
}
