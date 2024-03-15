

import 'package:nt_homework/data/model/country_model.dart';

import '../network/api_provider.dart';

class CountryRepository {
  final ApiProvider apiProvider;

  CountryRepository({required this.apiProvider});

  Future<List<CountryModel>> getCountries() => apiProvider.getCountries();
}