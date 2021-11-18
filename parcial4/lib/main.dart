// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sucursales Telollevo SV",
      home: MyHomePage(),
      color: Colors.black,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final snippet = '''La organización Telollevo SV
                  provee un sistema que permite a
                  otras empresas
                  almacenar los sitios Web para sus
                  negocios. La organización es de
                  reciente creación y de
                  momento únicamente tiene
                  disponible una a infraestructura
                  necesaria para montar servidores de
                  implementar una palicacion, idea es
                  necesario el se expanda sobre la''';

  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition puntoInicial = CameraPosition(
    target: LatLng(13.48797077450304, -88.24525737167973),
    zoom: 9,
    );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sucursales Telollevo SV"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Map(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _originalPosition,
        label: Text('Todas las Sucursales'),
        icon: Icon(Icons.home),
      ),
      drawer: _drawer(),
    );
  }

   Future<void> _originalPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(puntoInicial));
  }

  Widget Map(){
    final Marker _sucursal1 = Marker(
      markerId: MarkerId('S1'),
      infoWindow: InfoWindow(
        title:'Telollevo SV Sucursal Usulután',
        snippet: snippet,
        ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),   
      position: LatLng(13.343592643596232, -88.44502508257457)
      );

      final Marker _sucursal2= Marker(
      markerId: MarkerId('S2'),
      infoWindow: InfoWindow(
        title:'Telollevo SV Sucursal San Miguel',
        snippet: snippet,
        ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),   
      position: LatLng(13.472075080163055, -88.1732418493364)
      );

      final Marker _sucursal3= Marker(
      markerId: MarkerId('S3'),
      infoWindow: InfoWindow(
        title:'Telollevo SV Sucursal Morazán',
        snippet: snippet,
        ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),   
      position: LatLng(13.767603868720112, -88.10839608331976)
      );

      final Marker _sucursal4= Marker(
      markerId: MarkerId('S4'),
      infoWindow: InfoWindow(
        title:'Telollevo SV Sucursal La Unión',
        snippet: snippet,
        ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),   
      position: LatLng(13.336529529466207, -87.85226981125444)
      );

    return GoogleMap(
        mapType: MapType.normal,
        markers:{
          _sucursal1,
          _sucursal2,
          _sucursal3,
          _sucursal4
        } ,
        initialCameraPosition: puntoInicial,
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: false,
      );
  }

  Widget _drawer(){
    return Drawer(
      
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("ÁMILTONR"),
            accountEmail: Text("xyz@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("AR"),
            ),
            otherAccountsPictures:const[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("abc"),
              )
            ],
          ),
          ListTile(
            title:  Text("Sucursales"),
            leading:  Icon(Icons.bus_alert),
          ),
          Divider(),
          ListTile(
            onTap: (){
              _goTo(13.343592643596232, -88.44502508257457);
              Navigator.of(context).pop();
            },
            title:  Text("Suc. Usulután"),
            trailing:  Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goTo(13.472075080163055, -88.1732418493364);
              Navigator.of(context).pop();
            },
            title:  Text("Suc. San Miguel"),
            trailing:  Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goTo(13.767603868720112, -88.10839608331976);
              Navigator.of(context).pop();
            },
            title:  Text("Suc. Morazán"),
            trailing:  Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              _goTo(13.336529529466207, -87.85226981125444);
              Navigator.of(context).pop();
            },
            title:  Text("Suc. La Unión"),
            trailing:  Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

Future<void> _goTo(double lat, double long) async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), 15));
  }
}
