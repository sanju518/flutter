// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutterspod/provider/count_provider.dart';
//
//
//
// class HomePage extends StatelessWidget {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     print('builds');
//     return Scaffold(
//         body: SafeArea(
//           child: Container(
//             width: double.infinity,
//             child: Consumer(
//               builder: (context, ref, child) {
//                 // final state = ref.watch(CountProvider).number;
//                 // final st = ref.watch(CountProvider).nameSome;
//                 //final d = ref.watch(CountProvider);
//                 final d = ref.watch(CountState);
//
//
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Consumer(
//                     //     builder: ( context, ref, child) {
//                     //       final data = ref.watch(someData);
//                     //       return Text('data');
//                     //     }
//                     // ),
//
//                     Text('$d', style: TextStyle(fontSize: 50),),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextButton(onPressed: () {
//                          // ref.read(CountProvider).increment();
//                           ref.read(CountState.notifier).state = 90;
//
//                         }, child: Text('Increment')),
//                         TextButton(onPressed: () {}, child: Text('Decrement')),
//
//                       ],
//                     )
//                   ],
//                 );
//               }
//             ),
//           ),
//         )
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/constants/app_sizes.dart';
import 'package:flutterspod/provider/todo_provider.dart';

import '../models/todo.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(todoProvider);
    print(state);
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                 TextFormField(
                   controller: todoController,
                   onFieldSubmitted: (val){
                     if(val.isEmpty){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         duration: Duration(seconds: 1),
                           content: Text('please provide value')
                       ));
                     }else{
                       ref.read(todoProvider.notifier).addTodo(
                         Todo(DateTime: DateTime.now().toString(), todo: val.trim())
                       );
                       todoController.clear();
                     }
                   },
                   decoration: InputDecoration(
                     hintText: 'add some todo',
                     prefixIcon: Icon(Icons.abc)
                   ),
                 ),
                  AppSizes.gapW14,
                  Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                          itemBuilder: (context, index){
                           final todo = state[index];
                           final date = DateTime.parse(todo.DateTime);
                           final d = DateFormat.yMd().format(date);
                           print(d);
                           return ListTile(
                             contentPadding: EdgeInsets.zero,
                             leading: Icon(Icons.task),
                             title: Text(todo.todo),
                             subtitle: Text('createdAt:-$d'),
                             trailing: Container(
                               width: 100,
                               child: Row(
                                 children: [
                                   IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                                  IconButton(onPressed: (){
                                    ref.read(todoProvider.notifier).removeTodo(index);
                                  }, icon: Icon(Icons.delete)),

                            ],
                               ),
                             ),
                           );
                          },
                          separatorBuilder: (c, i) {
                            return Divider();
                          },
                          itemCount: state.length
                      )
                  )
                ],
              ),
            )
        )
    );
  }
}
