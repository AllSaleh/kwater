import 'package:khwater/main.dart';

bool isLight(){
  if(sharedPrefe.getString('theam') == 'light'){
    return true;
  }
  else{
    return false;
  }
}