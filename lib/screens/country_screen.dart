import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/country_model.dart';
import '../view_model/country_view_model.dart';
class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Countries"),
        ),
    body: context.watch<CountryViewModel>().isLoading1 ?
    const Center(child: CircularProgressIndicator()) :
    RefreshIndicator(
      onRefresh: (){
        return Future<void>.delayed(
            const Duration(seconds: 2),
                (){
              context.read<CountryViewModel>().fetchCountries();
            }
        );
      },
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          ...List.generate(
            context.watch<CountryViewModel>().countries.length,
                (index) {
             CountryModel country= context.watch<CountryViewModel>().countries[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(16,16)
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: ClipRRect(
                            borderRadius:  BorderRadius.circular(18),
                            child: Image.network(country.flags["png"],fit: BoxFit.cover,))),
                    Expanded (
                      flex: 2,
                      child: Text(country.status,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),),
                    ),
                    Expanded (
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Text(country.flags["alt"] ?? " This is flag",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Future<void>.delayed(
              const Duration(seconds: 2),
                  (){
                context.read<CountryViewModel>().fetchCountries();
              }
          );
        },
        child: Icon(Icons.get_app),
      ),
    );
  }
}
