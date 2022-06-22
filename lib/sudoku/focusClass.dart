import 'package:flutter/cupertino.dart';

class FocusClass {
  int? indexBox;
  int? indexChar;

  setData(int indexBox, int indexChar){
    this.indexBox = indexBox;
    this.indexChar = indexChar;
  }
  FocusOn(int indexBox, int indexChar){
   return this.indexBox == indexBox && this.indexChar == indexChar;
  }

}