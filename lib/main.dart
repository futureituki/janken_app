import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '';
  String cpuHand = '';
  String result = '';
  void geeneratedCpuHands() {
    final randomNumber = Random().nextInt(3);
    cpuHand = randomNumberToHand(randomNumber);
  }

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    geeneratedCpuHands();
    judge();
    setState(() {});
  }

  void judge() {
    if (myHand == cpuHand) {
      result = '引き分け';
    } else if (myHand == '✊' && cpuHand == '✌️') {
      result = '勝ち';
    } else if (myHand == '✋' && cpuHand == '✊') {
      result = '勝ち';
    } else if (myHand == '✌️' && cpuHand == '✋') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✋';
      case 2:
        return '✌️';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('じゃんけんアプリ'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                  fontSize: 34,
                  color: result == '勝ち'
                      ? const Color.fromARGB(255, 14, 22, 28)
                      : Colors.red),
            ),
            SizedBox(
              height: 42,
            ),
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'CPU',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      cpuHand,
                      style: TextStyle(fontSize: 34),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      myHand,
                      style: TextStyle(fontSize: 34),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '自分',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('✊'),
                  onPressed: () {
                    selectHand('✊');
                  },
                ),
                ElevatedButton(
                  child: Text('✋'),
                  onPressed: () {
                    selectHand('✋');
                  },
                ),
                ElevatedButton(
                  child: Text('✌️'),
                  onPressed: () {
                    selectHand('✌️');
                  },
                ),
              ],
            ),
          ],
        )));
  }
}
