import 'package:flutter/material.dart';
import 'package:flutterspod/constants/app_sizes.dart';
import 'package:flutterspod/models/book.dart';



class  DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Image.network(
                    fit: BoxFit.cover,
                      'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bmF0dXJlfGVufDB8MHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60'
                  )),
               AppSizes.gapH20,
                   Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                   child: Column(
                    children: [
                     Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                        width: 210,
                           child: Text(
                           book.title,
                            style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                           ),
                             ),
                                   ),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(book.rating),
                                Text(
                                book.genre,
                                style: const TextStyle(
                                fontSize: 13,
                                color: Colors.blue,
                                ),
                                ),
                                ],
                                ),
                                ],
                                ),
                                AppSizes.gapH20,
                          Text(book.detail, style: TextStyle(fontSize: 15, color: Colors.black45)),


                          Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )

                              ),
                                onPressed: (){},
                                child: Text('Read book')),
                            AppSizes.gapW14,
                            OutlinedButton(
                                onPressed: (){},
                                child: Text('More Info'))

                          ],
                        ),

                      ]
                    ),
                  ),
              ],
    ),
    );
            }
          }
