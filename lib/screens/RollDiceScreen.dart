import 'dart:math';

import 'package:flutter/material.dart';

class RollDiceScreen extends StatefulWidget {
  const RollDiceScreen({super.key});

  @override
  State<RollDiceScreen> createState() => _RollDiceScreenState();
}

class _RollDiceScreenState extends State<RollDiceScreen> {
  int activeDiceFace = 5;
  List<String> diceImage = [
    'https://upload.wikimedia.org/wikipedia/commons/2/2c/Alea_1.png',
    'https://upload.wikimedia.org/wikipedia/commons/b/b8/Alea_2.png',
    'https://upload.wikimedia.org/wikipedia/commons/2/2f/Alea_3.png',
    'https://upload.wikimedia.org/wikipedia/commons/8/8d/Alea_4.png',
    'https://upload.wikimedia.org/wikipedia/commons/5/55/Alea_5.png',
    'https://upload.wikimedia.org/wikipedia/commons/f/f4/Alea_6.png',
    'https://image.similarpng.com/very-thumbnail/2021/05/Illustration-of-dice-on-transparent-background-PNG.png',
  ];

  @override
  Widget build(BuildContext context) {
    print(diceImage);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade600,
            Colors.purple.shade800,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Roll Dice',
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              if (activeDiceFace > 3)
                Text(
                  'Yehey! You got ${activeDiceFace + 1}',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                  ),
                ),
              Image.network(
                diceImage[activeDiceFace],
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  //generate random 0 - 5
                  var ranNum = Random().nextInt(6);
                  setState(() {
                    activeDiceFace = ranNum;
                  });

                  print('button pressed');
                },
                child: const Text(
                  'Roll!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}