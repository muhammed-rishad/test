
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/viewModel/Login_provider.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userNameController=TextEditingController();

  TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Login',style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Field is empty";
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'User name')),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Field is empty";
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Password')),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  color: Colors.blue,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginProviderr>().login(context,
                            username: _userNameController.text,
                            password: _passwordController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Empty Fields')),
                        );
                      }
                    },
                    child: Text('LOGIN',style: TextStyle(
                      color: Colors.white
                    ),)),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _passwordController.clear();
                        _userNameController.clear();
                      });
                    },
                    child: Text('CLEAR',style: TextStyle(
                        color: Colors.white
                    ),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
