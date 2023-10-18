import 'package:flutter/material.dart';



class ResponsePage extends StatelessWidget {
  const ResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height
    - MediaQuery.of(context).padding.top - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
                child: Image.network(
                    'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8MHwwfHx8MA%3D%3D&w=800',
                  fit: BoxFit.cover,
                )
            ),


            // Container(
            //   color: Colors.amber,
            //   height: 100,
            //   width: 100,
            //   child: Text('khgduyrhfskjkjxhgjuyewudhjsyfuesfhesiufishfisuffjiu', maxLines: 3,),
            // ),
            //
            // Container(
            //   height: 100,
            //     color: Colors.red,
            //     child: FittedBox(
            //         child: Text('kgjguiejldkfiseufhesjfiusiudchs', style: TextStyle(fontSize: 70),)),
            // ),
            // Container(
            //       height: 200,
            //       width: width * 0.5,
            //       padding: EdgeInsets.only(bottom: 10),
            //       color: Colors.green,
            //       child: LayoutBuilder(
            //         builder: (context, contrs){
            //           return Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Container(
            //                height: contrs.maxHeight ,
            //                 width: 100,
            //                 color: Colors.red,
            //               ),
            //             ],
            //           );
            //
            //         }
            //
            //
            //       ),
            //     ),
          ],
        ),

        );

  }
}




