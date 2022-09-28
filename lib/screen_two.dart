import 'package:flutter/material.dart';
import 'dart:math';

class ScreenTwo extends StatefulWidget {
  final int number;
  const ScreenTwo({super.key, required this.number});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  int? randomNumber;
  List? randomList;
  Color? color;
  List? numbersList = [];
  @override
  void initState() {
    randomList = List.generate(widget.number, (index) => index);
    randomList!.shuffle();
    print(randomList);
    randomNumber = randomList![0];
    print(randomNumber);
    color = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
          itemCount: widget.number,
          itemBuilder: (context, index) {
            bool isClickable = index == randomNumber;
            return isClickable
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        color = Colors.green;
                        randomList!.remove(randomNumber);
                        if (randomList!.isNotEmpty) {
                          randomNumber = randomList![0];
                        } else {
                          return;
                        }
                        print(randomList);
                        print(randomNumber);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(width: 1.5, color: Colors.grey),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.5, color: Colors.grey),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
