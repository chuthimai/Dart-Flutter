import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random(); // don't change

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});
  @override
  State<DiceRoll> createState() {
    // TODO: implement createState
    return _DiceRollSate();
  }

}

class _DiceRollSate extends State<DiceRoll> {
  var activeDiceImages = [
    "assets/images/dice-1.png",
    "assets/images/dice-2.png",
    "assets/images/dice-3.png",
    "assets/images/dice-4.png",
    "assets/images/dice-5.png",
    "assets/images/dice-6.png",
  ];
  var activeDiceImage = "assets/images/dice-1.png";

  void rollDice() {
    setState(() {
      var randomNumber = randomizer.nextInt(6);
      activeDiceImage = activeDiceImages.elementAt(randomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20,),
        ElevatedButton(
            onPressed: rollDice,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.pink[900],
              backgroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 25),
              // padding: const EdgeInsets.all(20),
              // style  button
            ),
            child: const Text("Roll Dice")
        )
      ],
    );
  }
  
}
