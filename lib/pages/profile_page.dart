import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.person_pin, size: 120, color: Color(0xFFE40323)),
              Flexible(
                child: Text("Muhammad Ridho",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 10),
                Text("Phone number",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("+60 139459295"),
                SizedBox(height: 10),
                Text("E-mail", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("mbridho@gmail.com"),
                SizedBox(height: 10),
                Text("Date of birth",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("21/07/2001"),
                SizedBox(height: 10),
                Text("Home address",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("+60 139459295"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
