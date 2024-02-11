import 'package:flutter/material.dart';
import 'package:flutter_bites/screens/menu_screen.dart';
import 'package:flutter_bites/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Guess Who's Cooking?",
                  // "Indulge in Burger Bliss",
                  style: GoogleFonts.architectsDaughter(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Lottie.network(
                //   "https://lottie.host/3d1b12ac-61fb-4bbc-8932-1dfc0623c925/tFJtCVgTQB.json",
                // ),
                Lottie.asset("assets/animations/burger.json"),
                Container(
                    // margin: EdgeInsets.only(top: 60),
                    child: MyButton(
                        name: "Burger Bonzana",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const MenuScreen()));
                        }))
              ],
            )));
  }
}
