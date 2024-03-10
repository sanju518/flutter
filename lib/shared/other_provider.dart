import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'other_provider.g.dart';


@riverpod
class Mode extends _$Mode {
  @override
  AutovalidateMode build() => AutovalidateMode.disabled;

  void change() => state =  AutovalidateMode.onUserInteraction;

}


@riverpod
class Toggle extends _$Toggle {

  @override
  bool build() => false;


  void change() {

    state = !state;
  }



}


@riverpod
class Photo extends _$Photo {
  @override
  XFile? build() {
    return null;
  }

  Future<void> pickImage(bool isCamera) async{
    final picker = ImagePicker();
    if(isCamera){
      state = await picker.pickImage(source: ImageSource.camera);
    }else{
      state = await picker.pickImage(source: ImageSource.gallery);
    }

  }

}

