import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterspod/constants/app_sizes.dart';
import 'package:flutterspod/provider/auth_provider.dart';
import 'package:flutterspod/provider/cart_provider.dart';
import 'package:flutterspod/views/main/admin_page/product_list.dart';
import 'package:flutterspod/views/main/user_page/order_history.dart';
import 'package:get/get.dart';



class DrawerWidget extends StatelessWidget{
  final WidgetRef ref;
  const DrawerWidget({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    return  Drawer(
      child: ListView(
        children: [
           AppSizes.gapH14,
          DrawerHeader(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(state.user != null) Text(state.user!.email),
              if(state.user != null) Text(state.user!.fullname),
            ],
          )),
          if(state.user?.isAdmin == true)ListTile(
            onTap: (){
              Get.back();
              Get.to(() => ProductList(), transition:  Transition.leftToRight);
            },
            leading: Icon(Icons.propane_tank),
            title: Text('product list'),
          ),
          if(state.user?.isAdmin != true) ListTile(
            onTap: (){
            Get.to(() => OrderHistory(), transition:  Transition.leftToRight);
            },
            leading: Icon(Icons.history),
            title: Text('order_history'),
          ),
          ListTile(
            onTap: (){
              ref.read(authProvider.notifier).userLogOut();
              ref.read(cartProvider.notifier).clearAll();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('userLogOut'),
          ),

        ],
      ),
    );
  }
}
