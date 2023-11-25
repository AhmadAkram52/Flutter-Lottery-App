import 'dart:math';

import 'package:flutter/material.dart';

class LotteryApp extends StatefulWidget {
  const LotteryApp({super.key});

  @override
  State<LotteryApp> createState() => _LotteryAppState();
}

class _LotteryAppState extends State<LotteryApp> {
  Random random = Random();
  int a = 0;
  int ranNum = 0;
  int dollar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          'Lottery App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              '$a',
              style: const TextStyle(fontSize: 20, color: Colors.pink),
            ),
            const SizedBox(height: 2),
            const Center(child: Text('Winning Number')),
            const SizedBox(height: 30),
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: a != ranNum
                    ? Colors.pink.withOpacity(0.2)
                    : Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    a != ranNum ? Icons.error_outline : Icons.done_all,
                    color: a != ranNum ? Colors.red : Colors.green,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    a != ranNum
                        ? 'Better Luck Next Time Your Number Is $ranNum \n Try Again!'
                        : 'Congratulation You Wins $dollar\$ ! \n Your Number $a',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: a == ranNum
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: a != ranNum
            ? const EdgeInsets.only(bottom: 100.0)
            : const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            setState(() {
              if (a == ranNum) {
                a = random.nextInt(10);
              }
            });
            dollar = random.nextInt(1000);
            ranNum = random.nextInt(10);
          },
          child: Icon(
            a == ranNum ? Icons.refresh : Icons.play_arrow_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
