
import 'package:flutter/foundation.dart';

class ClassProvider1 with ChangeNotifier{
  var counter = 100;

  void Pluse(){
    counter++;
    print(counter);
    notifyListeners();
  }

  void minus(){
    counter--;
    print(counter);
    notifyListeners();
  }

}