import 'package:flutter/material.dart';
import 'package:nt_homework/data/local/calculator_item_model.dart';


class CalculatorItem extends StatelessWidget {
  const CalculatorItem({super.key, required this.calculatorItemModel});
  final CalculatorItemModel calculatorItemModel;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: InkWell(
        onTap: calculatorItemModel.onTap,
        child: Center(
          child: calculatorItemModel.isIcon==false ?
          Text(calculatorItemModel.text!,style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: calculatorItemModel.color,
          ),) :
          calculatorItemModel.icon,
        ),
      ),
    )
      ;
  }
}
