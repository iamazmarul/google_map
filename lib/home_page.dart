import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 17,
          bearing: 0,
          target: LatLng(22.710361, 90.363845),
        ),
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: <Marker>{
          Marker(
            markerId: const MarkerId("initialPosition2"),
            position: const LatLng(22.710361, 90.363845),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(
                title: "Cicada Solutions", snippet: "IT Company"),
            draggable: true,
          ),
          Marker(
            markerId: const MarkerId("initialPosition"),
            position: const LatLng(22.715527, 90.374472),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow:
                const InfoWindow(title: "Pixel Tech", snippet: "IT Company"),
            draggable: true,
          ),
        },
        polylines: {
          const Polyline(
              polylineId: PolylineId("line"),
              color: Colors.red,
              width: 3,
              patterns: [
                PatternItem.dot,
              ],
              points: [
                LatLng(22.710361, 90.363845),
                LatLng(22.715527, 90.374472),
              ])
        },
      ),
    );
  }
}
