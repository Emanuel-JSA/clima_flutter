import 'package:flutter/material.dart';
import 'package:clima/style.dart';
import 'loading_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color wheaterColor = ClimaColors.random();

    return Scaffold(
      body: Container(
        color: wheaterColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Text('Discover the wheater in your city', style: TextStyles.h1),
                SizedBox(height: 16),
                Text('Get to know your wheater and precipitation forecast',
                    style: TextStyles.h2),
                SizedBox(height: 42),
                FilledButton(
                  onPressed: () async {
                    wheaterPageNavigator(context, wheaterColor);
                  },
                  style: ButtonStyles.startButton.copyWith(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(wheaterColor),
                  ),
                  child: Text(
                    'Get started',
                    style:
                        TextStyles.h2.copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void wheaterPageNavigator(BuildContext context, Color bgColor) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingPage(bgColor: bgColor),
      ),
    );
  }
}
