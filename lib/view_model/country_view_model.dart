import 'package:flutter/cupertino.dart';
import 'package:nt_homework/data/model/country_model.dart';
import 'package:nt_homework/data/repository/country_repository.dart';



class CountryViewModel extends ChangeNotifier{
  CountryViewModel({
    required this.countryRepository,
  });
  final CountryRepository countryRepository;
  bool isLoading1 = false;
  List<CountryModel> countries=[];

  fetchCountries () async{
    isLoading1=true;
    notifyListeners();
    var CountryOne= await countryRepository.getCountries();
    isLoading1 = false;
    notifyListeners();
    if(CountryOne.isEmpty){}
    else{
      countries=CountryOne;
      notifyListeners();
    }
  }

}