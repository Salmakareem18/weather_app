import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather now 😔',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          Text(
            'Start searching now 🔎',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
