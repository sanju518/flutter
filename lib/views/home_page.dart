import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspod/constants/app_sizes.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //backgroundColor: Colors.red,
      //toolbarHeight:90 ,
      title:Text('Hi John'),
      //backgroundColor: Colors.black,
      //foregroundColor: Colors.red,
      //centerTitle:true,
      actions: [
        Icon(Icons.search),
        //SizedBox(width: 20,),
        AppSizes.gapW12,
        Icon(CupertinoIcons.bell),
        //SizedBox(width: 20,)
        AppSizes.gapW20,
      ],
      ),
      body:Container(
        height: 200,
       padding: EdgeInsets.all(20),
       //margin: EdgeInsets.all(20),
       //margin:EdgeInsets.only(left: 20, top: 20),
       //margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
       width: double.infinity,
       color: Colors.red.shade200,
        child:

        //   Text.rich(
        //   TextSpan(
        //    children: [
        //      TextSpan(
        //        style: TextStyle(color: Colors.red),
        //        text: 'hello world'
        //      ),
        //      TextSpan(
        //        text: 'sello',
        //        style: TextStyle(color: Colors.blue)
        //      )
        //    ]
        //   )
        // )

        Text(
        'Hello World\nGood Morning',
       style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          height:2,
          letterSpacing: 2,
           wordSpacing: 3,
           fontStyle: FontStyle.italic,
         decoration: TextDecoration.underline,
         shadows: [
           Shadow(color: Colors.blue,blurRadius: 50,offset:Offset(30, 20)),
           Shadow(color: Colors.amber,blurRadius: 50,offset:Offset(30, 20)),

         ]

    )
    ),
    //    child: ListView(
    //      // crossAxisAlignment: CrossAxisAlignment.center,
    //      // mainAxisAlignment: MainAxisAlignment.spaceAround,
    //      children:[
    //        Column(
    //          children: [
    //             Container(
    //             height: 20,
    //             width: 20,
    //              color: Colors.red,
    //              ),
    //              Container(
    //               height: 20,
    //                width: 20,
    //                color: Colors.blue,
    //              ),
    //                Container(
    //                 height: 20,
    //                  width: 20,
    //                   color: Colors.black,
    //              ),
    //          ],
    //        ),
    //      ],
    // ),
      )
    );
      //backgroundColor: Colors.red.shade500,
      //backgroundColor:Colors(0xFFAA65A8),
      //backgroundColor: Color.fromRGBO(200, 100, 90 , 1),

  }
}

