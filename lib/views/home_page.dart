import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/provider/count_provider.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutterspod/provider/count_provider.dart';



class HomePage extends ConsumerWidget {





  @override
  Widget build(BuildContext context, ref) {
    print('builds');
    final number = ref.watch(CountProvider).number;
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Consumer(
                //     builder: ( context, ref, child) {
                //       final data = ref.watch(someData);
                //       return Text('data');
                //     }
                // ),
                Text('$number', style: TextStyle(fontSize: 50),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      ref.read(CountProvider).increment();


                    }, child: Text('Increment')),
                    TextButton(onPressed: (){}, child: Text('Decrement')),

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
