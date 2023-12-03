import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

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
              Row(
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: randomNumbers
                      .asMap()
                      .entries
                      .map(
                        (x) => Padding(
                          padding:
                              EdgeInsets.only(bottom: x.key == randomNumbers.length ? 0 : 16.0),
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
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: RED_COLOR,
                  ),
                  onPressed: () {
                    final random = Random();

                    final Set<int> newNumbers = {};

                    while (newNumbers.length != 5) {
                      final number = random.nextInt(9);

                      newNumbers.add(number);
                    }

                    setState(() {
                      randomNumbers = newNumbers.toList();
                    });
                  },
                  child: Text('생성하기'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
