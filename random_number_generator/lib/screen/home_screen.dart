import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [
    0,
    0,
    0,
    0,
    0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(onPressed: onRandomNumberGenerate),
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {
    final random = Random();

    final Set<int> newNumbers = {};

    while (newNumbers.length != 5) {
      final number = random.nextInt(9);

      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '연금 복권 숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SettingsScreen();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (x) => Padding(
                padding: EdgeInsets.only(
                    bottom: x.key == randomNumbers.length ? 0 : 16.0),
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map(
                        (y) => Image.asset(
                          'asset/img/$y.png',
                          height: 70.0,
                          width: 50.0,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR,
        ),
        onPressed: onPressed,
        child: const Text('생성하기'),
      ),
    );
  }
}
