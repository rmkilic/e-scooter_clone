import 'package:e_scooter/constant/app_constant.dart';
import 'package:e_scooter/constant/cons_colors.dart';
import 'package:e_scooter/core/extension/context_extension.dart';
import 'package:e_scooter/enums/animation_enums.dart';
import 'package:e_scooter/enums/icon_enums.dart';
import 'package:e_scooter/models/scooter_model.dart';
import 'package:e_scooter/view/scooter/scooter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'widget/_bottom_sheet.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  late PolylinePoints _polylinePoints;

  // Kullanıcı konumu
  final LatLng userLocation = LatLng(37.422067, -122.104214);

  // Scooter konumları
  final List<LatLng> scooterLocations = [
    LatLng(37.424360, -122.114318),
    LatLng(37.431065, -122.119767),
    LatLng(37.428916, -122.123232),
    LatLng(37.415102, -122.118685),
  ];

  BitmapDescriptor? userIcon;
  BitmapDescriptor? scooterIcon;
  String? _mapStyle;
  @override
  void initState() {
    super.initState();
    _polylinePoints = PolylinePoints();
      _loadMapStyle();
    _loadCustomMarkers();
  }
  // Stil dosyasını oku
void _loadMapStyle() async {
  _mapStyle = await DefaultAssetBundle.of(context).loadString('assets/map_style_dark.json');
}

  Future<void> _loadCustomMarkers() async {
    userIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      ImageEnums.locaiton.toPath,
    );
    scooterIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(54, 54)),
      ImageEnums.marker.toPath,
    );

    _setMarkers();
  }

  void _setMarkers() {
    setState(() {
      // Kullanıcı marker
      _markers.add(
        Marker(
          markerId: MarkerId('user'),
          position: userLocation,
          icon: userIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );

      // Scooter markerları
      for (int i = 0; i < scooterLocations.length; i++) {
        _markers.add(
          Marker(
            markerId: MarkerId('scooter_$i'),
            position: scooterLocations[i],
            icon: scooterIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            onTap: () {
              _drawRouteToScooter(scooterLocations[i]);
            },
          ),
        );
      }
    });
  }

  // Seçilen scooter’a rota çiz
  void _drawRouteToScooter(LatLng scooterLocation) async {
    setState(() {
      _polylines.clear(); // Önceki rotaları temizle
    });

    List<LatLng> route = await _getRoutePoints(userLocation, scooterLocation);
    setState(() {
      _polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          points: route,
          color: Color(0xFFE5842A),
          jointType: JointType.round,
    patterns: [
      PatternItem.dash(30),
      PatternItem.gap(20),
    ],
          width: 3,
        ),
      );
    });
  }

  // İki nokta arasındaki rota noktalarını al
  Future<List<LatLng>> _getRoutePoints(LatLng start, LatLng end) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(start.latitude, start.longitude),
        destination: PointLatLng(end.latitude, end.longitude),
        mode: TravelMode.walking,
      ),
      googleApiKey: AppConstant.googleApiKey,
    );

    if (result.points.isNotEmpty) {
      for (PointLatLng point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    return polylineCoordinates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: _map()),
          _weather(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _Bottom_Sheet())
        ],
      )
    );
  }

  _map()
  {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: userLocation,
          zoom: 14,
        ),
        mapType: MapType.normal,
        style: _mapStyle,
        markers: _markers,
        polylines: _polylines,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      );
  }

  _weather()
  {
    return Positioned(
      top: 77,
      right: 20,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 9),
        width: 100,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), 
        color: Color.fromRGBO(217, 217, 217, 0.2)
        ),
        child: Row(
          children: [
            Text("15%", style: context.textThem.titleMedium!.copyWith(color: Colors.white),),
            SizedBox(width: 10,),
            Image.asset(ImageEnums.rainy.toPath, width: 34, height: 34,)
          ],
        ),
      ),
    );
  }
}
