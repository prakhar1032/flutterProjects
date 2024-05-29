import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? _mapController;
  List<LatLng> _polylineCoordinates = [
    LatLng(26.134246, 91.736304),
    LatLng(26.136154, 91.737280),
    LatLng(26.137433, 91.738840),
    LatLng(26.138834, 91.740108),
    LatLng(26.139420, 91.740498),
    LatLng(26.140349, 91.741210),
    LatLng(26.141548, 91.741815),
    LatLng(26.142415, 91.742010),
    LatLng(26.143247, 91.741913),
    LatLng(26.144238, 91.741427),
  ];

  // for custom marker
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerPinIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/delivery.png",
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/circlepin.png",
    ).then(
      (icon) {
        setState(() {
          markerPinIcon = icon;
        });
      },
    );
  }

  List<Marker> markers = [];

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });

    markers = [
      Marker(
          markerId: MarkerId('start'),
          position: _polylineCoordinates.first,
          icon: markerPinIcon,
          infoWindow: InfoWindow(
            title: 'Start Point',
            snippet: '${_polylineCoordinates.first.toString()}',
            onTap: () {},
          )),
      Marker(
          markerId: MarkerId('end'),
          position: _polylineCoordinates.last,
          icon: markerPinIcon,
          infoWindow: InfoWindow(
            title: 'End Point',
            snippet: '${_polylineCoordinates.last.toString()}',
            onTap: () {},
          )),
    ];

    // Start moving the marker along the polyline
    moveMarker();
  }

  void moveMarker() async {
    for (LatLng point in _polylineCoordinates) {
      await Future.delayed(Duration(seconds: 3)); // Adjust delay as needed

      Marker newMarker = Marker(
        markerId: MarkerId('vehicle'),
        position: point,
        icon: markerIcon,
      );

      markers = [markers.first, newMarker, markers.last];

      _mapController?.animateCamera(
        CameraUpdate.newLatLng(point),
      );

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(26.134246, 91.736304),
            zoom: 15.0,
          ),
          markers: Set.from(markers),
          polylines: {
            Polyline(
              width: 5,
              polylineId: PolylineId('route'),
              color: Colors.blue,
              points: _polylineCoordinates,
            ),
          },
        ),
      ),
    );
  }
}
