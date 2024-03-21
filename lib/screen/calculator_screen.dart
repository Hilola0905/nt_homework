import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt_homework/screen/widgets/calculator_items.dart';
import 'package:nt_homework/view_model/calculator_view_model.dart';
import 'package:provider/provider.dart';

import '../data/local/calculator_item_model.dart';
import '../data/local/caulator_item_list.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

   final CalculatorViewModel calculatorViewModel=CalculatorViewModel();
   late CalculatorItems calculatorItems1;

  @override
   void initState() {
    Future.microtask(
            ()   {
                calculatorItems1=CalculatorItems(calculatorViewModel: calculatorViewModel);
            }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<CalculatorItemModel> calculatorItems=calculatorItems1.getList();

    return AnnotatedRegion(
      value: const  SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (_)=> calculatorViewModel,
          child: Consumer<CalculatorViewModel>(
            builder: (context, viewModel, child){
              return  Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const  EdgeInsets.symmetric(vertical: 20,horizontal: 24),
                          width: double.infinity,
                          child: Text(
                            textAlign: TextAlign.end,
                            viewModel.title,style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.2),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            )
                        ),
                        child:GridView.count(
                         physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            ...List.generate(
                                calculatorItems.length, (index) =>
                                CalculatorItem(calculatorItemModel: calculatorItems[index],)
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
