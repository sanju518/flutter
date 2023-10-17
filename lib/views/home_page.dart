import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspod/constants/app_sizes.dart';
import 'package:flutterspod/constants/book_data.dart';
import 'package:flutterspod/views/DetailPage.js.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.red,
        //toolbarHeight:90 ,
        title: Text('Hi John'),
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
      body: ListView(
        children: [
          // Container(
          //   width: 200,
          //   child: Card(
          //     color: Color(0xFF2F8D46),
          //     child: Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Column(
          //         children: [
          //           CircleAvatar(
          //               backgroundColor: Colors.green,
          //             child: CircleAvatar(
          //               radius: 15,
          //               backgroundColor: Colors.white,
          //             ),
          //           ),
          //           Text('Geeksforgeeks'),
          //           Text('JUiufsednfghkmgjfngmfclkjgjfngmdleiijgdmrrgkdhhkjh'),
          //           ElevatedButton(onPressed: (){}, child: Text('dfidgjfhg')),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
           Container(
             height: 250,
             width: 400,
             color: Colors.amber,
             child: Image.network(
              fit: BoxFit.cover,
               'https://images.unsplash.com/photo-1696650811922-9a14bf80be8a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=400&q=60',

             )),




        AppSizes.gapH16,

          Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Container(
                        width: 380,
                        margin: EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: (){
                            Get.to(() => DetailPage(book: book), transition: Transition.leftToRight);
                          },
                          child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 200,
                                    child: Card(
                                      child: Row(
                                        children:[
                                          Spacer(),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20, right: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(book.title),
                                                  Text(book.detail, maxLines: 4),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(book.rating),
                                                      Text(book.genre)

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 15,
                                    bottom: 20,
                                    child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10),
                                        child: Image.network(book.imageUrl, height: 200,)))
                              ]
                          ),
                        )
                             );
                               }
                        ),
                      ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
            child: Text('you may also like', style: TextStyle(fontSize: 25),),
          ),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Container(
                      margin:EdgeInsets.only(right: 10) ,
                      height: 100,
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Image.network(book.imageUrl, height: 100, width: 100, fit: BoxFit.cover),
                         Text(book.title),
                         Text(book.genre),

                        ],
                      ),
                    );


                        }
    ),
    ),
          AppSizes.gapH12,
      ],
    ));

                    // child: Column(
                    //   children: [
                    //     Text(books[index].title, style: TextStyle(color: Colors.white )),
                    //     Text(books[index].detail,
                    //         maxLines: 4,
                    //         style: TextStyle(color: Colors.white )),


                  }




        //       Container(
        //         height: 250,
        //         width: 400,
        //         color: Colors.amber,
        //         child: Image.asset(
        //          'assets/book.jpg',
        //         fit:BoxFit.cover,
        // )),


//       body:Container(
//         height: 200,
//        padding: EdgeInsets.all(20),
//        margin: EdgeInsets.all(20),
//        margin:EdgeInsets.only(left: 20, top: 20),
//        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//        width: double.infinity,
//        color: Colors.red.shade200,
//         child:
//
//           Text.rich(
//           TextSpan(
//            children: [
//              TextSpan(
//                style: TextStyle(color: Colors.red),
//                text: 'hello world'
//              ),
//              TextSpan(
//                text: 'sello',
//                style: TextStyle(color: Colors.blue)
//              )
//            ]
//           )
//         )
//
//         Text(
//         'Hello World\nGood Morning',
//        style: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//           height:2,
//           letterSpacing: 2,
//            wordSpacing: 3,
//            fontStyle: FontStyle.italic,
//          decoration: TextDecoration.underline,
//          shadows: [
//            Shadow(color: Colors.blue,blurRadius: 50,offset:Offset(30, 20)),
//            Shadow(color: Colors.amber,blurRadius: 50,offset:Offset(30, 20)),
//
//          ]
//
//     )
//     ),
//        child: ListView(
//          // crossAxisAlignment: CrossAxisAlignment.center,
//          // mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children:[
//            Column(
//              children: [
//                 Container(
//                 height: 20,
//                 width: 20,
//                  color: Colors.red,
//                  ),
//                  Container(
//                   height: 20,
//                    width: 20,
//                    color: Colors.blue,
//                  ),
//                    Container(
//                     height: 20,
//                      width: 20,
//                       color: Colors.black,
//                  ),
//              ],
//            ),
//          ],
//     ),
//       )
//     );
//       //backgroundColor: Colors.red.shade500,
//       //backgroundColor:Colors(0xFFAA65A8),
//       //backgroundColor: Color.fromRGBO(200, 100, 90 , 1),
//
//   }


  }
