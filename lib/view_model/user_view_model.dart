import 'package:flutter/cupertino.dart';
import 'package:nt_homework/data/repository/user_repository.dart';

import '../data/model/user_model.dart';

class UserViewModel extends ChangeNotifier{
  UserViewModel({
    required this.userRepository,
});
  final UserRepository userRepository;
  bool isLoading = false;
  List<UserModel> users=[];

  fetchUsers () async{
    isLoading=true;
    notifyListeners();
    var usersOne= await userRepository.getUsers();
    isLoading = false;
    notifyListeners();
    if(usersOne.isEmpty){}
    else{
      users=usersOne;
      notifyListeners();
    }
  }

}