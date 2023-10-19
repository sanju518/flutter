import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/provider/count_provider.dart';



class HomePage extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    print('builds');
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Consumer(
              builder: (context, ref, child) {
                // final state = ref.watch(CountProvider).number;
                // final st = ref.watch(CountProvider).nameSome;
                final d = ref.watch(CountProvider);


                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Consumer(
                    //     builder: ( context, ref, child) {
                    //       final data = ref.watch(someData);
                    //       return Text('data');
                    //     }
                    // ),
                    Text(d.nameSome),
                    Text('${d.number}', style: TextStyle(fontSize: 50),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {
                          ref.read(CountProvider).increment();
                        }, child: Text('Increment')),
                        TextButton(onPressed: () {}, child: Text('Decrement')),

                      ],
                    )
                  ],
                );
              }
            ),
          ),
        )
    );
  }
}
