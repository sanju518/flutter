import 'package:flutter/material.dart';
import 'package:flutterspod/map_show.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';



class LocationCheck extends StatelessWidget {


  Position? position;


  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            final permission = await Geolocator.checkPermission();

            if(permission == LocationPermission.denied){
             await Geolocator.checkPermission();
            }else if(permission == LocationPermission.deniedForever){
              await Geolocator.openAppSettings();
            }else{
              position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
              if(position == null){
                Get.to(() => MapSample(lat: position!.altitude,long: position!.longitude,));
              }
            }


          }, child: Text('Location')
        )
      )

      );

  }
}
