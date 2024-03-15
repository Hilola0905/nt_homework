
import 'package:nt_homework/data/model/user_model.dart';

import '../network/api_provider.dart';

class UserRepository {
  final ApiProvider apiProvider;

  UserRepository({required this.apiProvider});

  Future<List<UserModel>> getUsers() => apiProvider.getUsers();
}