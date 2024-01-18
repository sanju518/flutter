import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/provider/movie_provider.dart';
import 'package:flutterspod/views/detail_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';



class TabBarWidgets extends ConsumerWidget {
  final String api;
  const TabBarWidgets({super.key, required this.api});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(movieProvider(api));
    return OfflineBuilder(
        child: Container(),
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return  state.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      key: PageStorageKey(api),
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 2 / 3
                      ),
                      itemBuilder: (context, index) {
                        final movie = data[index];
                        return InkWell(
                            onTap: () {
                              Get.to(() => DetailPage(movie: movie));
                            },
                            child: Image.network(movie.poster_path));
                      }
                  ),
                );
              },
              error: (err, st) {
                if(connected){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/images/internet.json'),
                      ElevatedButton(
                          onPressed: (){
                            ref.invalidate(movieProvider);
                          },
                          child: Text('click to refresh')
                      )
                    ],
                  );
                }else{
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/images/noConnect.json'),
                      ElevatedButton(
                          onPressed: (){
                            ref.invalidate(movieProvider(api));
                          },
                          child: Text('click to refresh')
                      )
                    ],
                  );
                }

              },
              loading: () => Center(child: CircularProgressIndicator())
          );
        }
    );
  }
}

