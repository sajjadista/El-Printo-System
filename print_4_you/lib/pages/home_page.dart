import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFE40323)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          style: GoogleFonts.montserrat(fontSize: 17),
                          children: [
                        const TextSpan(
                            text: "E-Wallet Balance\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        TextSpan(
                            text:
                                "As of ${DateFormat.yMMMd().format(DateTime.now())}")
                      ])),
                  const Text("RM 85.50",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (() => Navigator.pushNamed(context, '/uploaddoc')),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFE40323)),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: const [
                      Image(image: AssetImage("assets/printer.png")),
                      Text("Order now!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
