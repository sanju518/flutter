
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final CountState = StateProvider<int>((ref) => 0);

final someData = Provider<String>((ref) => 'Hello World');


final CountProvider = ChangeNotifierProvider((ref) => CountsNotifier(ref.watch(someData)));


    class CountsNotifier extends ChangeNotifier {
      final String nameSome;
      CountsNotifier(this.nameSome);


      int number = 0;
      void increment(){
        number++;
        notifyListeners();

      }
      void decreament(){
        number--;
        notifyListeners();
      }

    }

