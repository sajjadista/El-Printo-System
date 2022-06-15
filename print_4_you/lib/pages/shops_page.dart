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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.red,
                    title:
                    Text('DarnLukis'
                      ,style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      'Price from this shop: 1RM \nDistance from your location: 1.4 km'
                      ,style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    ),

                    actions: [
                      InkWell(onTap: () => {},
                        child: new Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: MediaQuery.of(context).size.height/8,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: new Border.all(color: Colors.white, width: 2.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child:
                          new Text('Order Now',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.red,
                                fontWeight:
                                FontWeight.w700),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Image.asset(
                'shop-icon.png',
                width: 22,
                fit: BoxFit.cover,
              ),
            ),
      ),
      //Shop2 location
      Marker(
        point: LatLng(2.992829362,101.704663848),
        builder: (ctx) =>
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.red,
                    title: Text('Print4You'
                      ,style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      'Price from this shop: 2RM \nDistance from your location: 4.4 km'
                      ,style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    ),
                    actions: [
                      InkWell(onTap: () => {},
                        child: new Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: MediaQuery.of(context).size.height/8,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: new Border.all(color: Colors.white, width: 2.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child:
                          new Text('Order Now',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.red,
                                fontWeight:
                                FontWeight.w700),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.red,
                    title: Text('Print Expert'
                      ,style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      'Price from this shop: 6RM \nDistance from your location: 2.4 km'
                      ,style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    ),
                    actions: [
                      InkWell(onTap: () => {},
                        child: new Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: MediaQuery.of(context).size.height/8,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: new Border.all(color: Colors.white, width: 2.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child:
                          new Text('Order Now',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.red,
                                fontWeight:
                                FontWeight.w700),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
