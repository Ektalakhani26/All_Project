
import 'package:flutter/foundation.dart';

class CounterClass with ChangeNotifier{
  var counter = 10;

  void PluseH(){
    counter++;
    print(counter);
    notifyListeners();
  }

  void minusH(){
    counter--;
    print(counter);
    notifyListeners();
  }

}