import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loanding extends StatefulWidget {
  @override
  _LoandingState createState() => _LoandingState();
}

class _LoandingState extends State<Loanding> {
  void setUpWorldTime() async {
    WorldTime theTime = WorldTime(
      location: 'Nairobi',
      flag: 'Nairobi.png',
      url: 'Africa/Nairobi',
    );

    await theTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': theTime.location,
      'time': theTime.time,
      'flag': theTime.flag,
      'isDayTime': theTime.isDayTime,
    });
  }

  @override
  void initState() {
    setUpWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          // child: SpinKitRotatingCircle(
          //   color: Colors.white,
          //   size: 50.0,
          // ),
          ),
    );
  }
}
