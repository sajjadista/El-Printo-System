import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[];
    //Shops locations array
    marker = [
      //Shop1 location
      Marker(
        point: LatLng(2.9993,101.7079),
        builder: (ctx) =>
            InkWell(
              onTap: () {},
              child: Image.asset(
                'shop-icon.png',
                width: 22,
                fit: BoxFit.cover,
              ),
            ),),
      //Shop2 location
      Marker(
        point: LatLng(2.992829362,101.704663848),
        builder: (ctx) =>
            InkWell(
              onTap: () {},
              child: Image.asset(
                'shop-icon.png',
                width: 22,
                fit: BoxFit.cover,
              ),
            ),
      ),
      //Shop3 location
      Marker(
        point: LatLng(2.996829362,101.7033),
        builder: (ctx) =>
            InkWell(
              onTap: () {},
              child: Image.asset(
                  'shop-icon.png',
                   width: 22,
                   fit: BoxFit.cover,
              ),
            ),
      ),
    ];

    return Scaffold(
      body: Center(
          child: Container(
            child: Column(
              children: [
                Flexible(
                  child: FlutterMap(options:
                  MapOptions(
                    //Whenever user clicks on the shops icon in the bottom nav bar. It will direct them to UPM Corrdinates
                    center: LatLng(2.9993,101.7079),
                    zoom: 14
                  ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        attributionBuilder: (_) {
                          return Text("© OpenStreetMap contributors");
                        },
                      ),
                      MarkerLayerOptions(
                        markers: marker,
                      ),
                    ],
                  ),
                )
              ],
            )
      ))
    );

  }
}
