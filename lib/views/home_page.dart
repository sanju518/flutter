import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspod/constants/api.dart';
import 'package:flutterspod/views/search_page.dart';
import 'package:flutterspod/views/widgets/tab_bar_widget.dart';
import 'package:get/get.dart';
//import 'package:podsriver/constants/api.dart';
//import 'package:podsriver/views/search_page.dart';
//import 'package:podsriver/views/widgets/tab_bar_widgets.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Movie TMDB'),
            actions: [
              IconButton(onPressed: (){
                Get.to(() => SearchPage(), transition:  Transition.leftToRight);
              }, icon: Icon(CupertinoIcons.search))
            ],
            bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'TopRated',
                  ),
                  Tab(
                    text: 'Upcoming',
                  )
                ]
            ),
          ),
          body: TabBarView(
            children: [
              TabBarWidgets(api: Api.popularMovie),
              TabBarWidgets(api: Api.topRatedMovie),
              TabBarWidgets(api: Api.upComingMovie),
            ],
          )
      ),
    );
  }
}