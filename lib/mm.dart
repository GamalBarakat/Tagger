// import 'package:flutter/material.dart';
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   // int _counter = 0;
//   //
//   // void _incrementCounter() {
//   //   setState(() {
//   //
//   //     _counter++;
//   //   });
//   // }
//
//   GlobalKey<ScaffoldState> scaffoldKey=new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       key:scaffoldKey ,
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Show Snackbar'),
//           onPressed: () {
//             final snackBar = SnackBar(
//               duration: Duration(milliseconds: 2),
//               content: Text('This is a snackbar'),
//             );
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           },
//         ),
//       ),
//       // Center(
//       //
//       //   child: Column(
//       //
//       //
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       InkWell(
//       //         onTap: (){
//       //
//       //
//       //           // showDialog(context: context, builder: (context){
//       //           //
//       //           //   return  AlertDialog(content: Text('Gamal Barakat Gamal'),title:Text('Gamal') ,);
//       //           // });
//       //       var snackbar=SnackBar(content:Text('GAmal Barakat GAmal Barakat GAmal Barakat') ,);
//       //       scaffoldKey.currentState.widget
//       //
//       //
//       //
//       //
//       //         },
//       //         child: const Text(
//       //           'You have pushed the button this many times:',
//       //         ),
//       //       ),
//       //
//       //     ],
//       //   ),
//       // ),
//      // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(31.205753, 29.924526),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition:CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(31.205753, 29.924526),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}