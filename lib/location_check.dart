import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'map_show.dart';


class CheckLocation extends StatefulWidget {
  const CheckLocation({super.key});

  @override
  State<CheckLocation> createState() => _CheckLocationState();
}

class _CheckLocationState extends State<CheckLocation> {

  Position? _position;
  LocationPermission? permission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
              onPressed: () async{
                print('aslkdjdsl');
                try{
                  permission =  await  Geolocator.checkPermission();
                  print(permission);
                  if(permission == LocationPermission.denied){
                    permission=  await Geolocator.checkPermission();
                  }else if(permission == LocationPermission.deniedForever){
                    await Geolocator.openAppSettings();
                  }else{
                    _position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high
                    );
                    if(_position !=null){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample(lat: _position!.latitude, long: _position!.longitude,)));
                    }
                  }
                }catch (err){
                  print(err);
                }



              }, child: const Text('Location')),
        )
    );
  }
}