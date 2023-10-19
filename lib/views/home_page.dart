import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/provider/count_provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 0;

  @override
  Widget build(BuildContext context) {
    print('builds');
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                    builder: ( context, ref, child) {
                      final data = ref.watch(someData);
                      return Text('data');
                    }
                ),
                Text('$age', style: TextStyle(fontSize: 50),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      setState(() {
                        age++;

                      });
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
