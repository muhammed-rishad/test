import 'package:flutter/material.dart';
import 'package:test_project/src/view/home_page.dart';


class LoginProviderr extends ChangeNotifier{

  login(BuildContext context,{required String username,required String password,GlobalKey<ScaffoldState>? scaffoldKey}){
    if(username==password){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          HomePage()
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credential')),
      );
    }
  }

  clearField(){}

}