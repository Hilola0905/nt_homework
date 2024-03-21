import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/calculator_view_model.dart';
import 'calculator_item_model.dart';
class CalculatorItems {
  CalculatorItems({
    required this.calculatorViewModel,
});
  final CalculatorViewModel calculatorViewModel;
   List<CalculatorItemModel> getList(){
    return [
      CalculatorItemModel(
        text: "C",
        icon: null,
        isIcon: false,
        onTap: ()  {
          calculatorViewModel.clearNumber();
          print("tap");
        },
        color: Colors.red,
      ),
      CalculatorItemModel(
        text: "%",
        icon: null,
        isIcon: false,
        onTap: (){
          print("tap");
          calculatorViewModel.writeNumber("%");
        },
        color: Colors.blue,
      ),
      CalculatorItemModel(
        text: null,
        icon: const Icon(Icons.clear,color: Colors.blue,),
        isIcon: true,
        onTap: () async {
          calculatorViewModel.deleteNumber();
        },
        color: Colors.blue,
      ),
      CalculatorItemModel(
        text: "/",
        icon: null,
        isIcon: false,
        onTap:() async {
          calculatorViewModel.writeNumber("/");
        },
        color: Colors.blue,
      ),
      CalculatorItemModel(
        text: "7",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("7");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "8",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("8");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "9",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("9");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "*",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("*");
        },
        color: Colors.blue,
      ),
      CalculatorItemModel(
        text: "4",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("4");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "5",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("5");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "6",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("6");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "-",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("-");
        },
        color: Colors.blue,
      ),
      CalculatorItemModel(
        text: "1",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("1");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "2",
        icon: null,
        isIcon: false,
        onTap:() async {
          calculatorViewModel.writeNumber("2");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "3",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("3");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "+",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber("+");
        },
        color: Colors.blue,
      ),
      CalculatorItemModel(
        text: ".",
        icon: null,
        isIcon: false,
        onTap: () async {
          calculatorViewModel.writeNumber(".");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "0",
        icon: null,
        isIcon: false,
        onTap:() async {
          calculatorViewModel.writeNumber("0");
        },
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: null,
        icon: const  Icon(Icons.refresh,color: Colors.blue),
        isIcon: true,
        onTap: (){},
        color: Colors.black,
      ),
      CalculatorItemModel(
        text: "=",
        icon: null,
        isIcon: false,
        onTap:  (){
          calculatorViewModel.getResult(calculatorViewModel.title);
        },
        color: Colors.blue,
      ),
    ];
  }
}


