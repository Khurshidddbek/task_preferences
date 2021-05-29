import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_preferences/model/user_model.dart';
import 'package:task_preferences/pages/home_page.dart';
import 'package:task_preferences/pages/singup_page.dart';
import 'package:task_preferences/servisec/pref_service.dart';

class LoginPage extends StatefulWidget {
  static final String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // To detect the active TextField and change its color
  bool _changedTextField1 = false;
  bool _changedTextField2 = false;

  void _doLogin() async {
    String email = _emailController.text.toString().trim();
    String password = _passwordController.text.toString().trim();

    Future<User> user = Prefs.loadUser();

    user.then((value) => () {
      print('user');
      print(value);
      if (value.email == email && value.password == password) {
        print('Welcome');
      }
      else {
        print('Password incorrect');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0627),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

            // logo
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/icons/login.svg'),
            ),

            // Text: Welcome back!
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Welcome back!', style: TextStyle(fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height * 0.035, letterSpacing: 1.3),),

                  Text('Log in to your existant account of Q Allure', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.015),)
                ],
              ),
            ),

            // Buttons
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.046,),

                  // email TextField
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
                    elevation: 20.0,
                    shadowColor: Colors.white70,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          _changedTextField1 = true;
                          _changedTextField2 = false;
                        });
                      },
                      controller: _emailController,
                      style: TextStyle(color: _changedTextField1 ? Colors.blue : Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey[350]),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                          child: Icon(Icons.person, color: _changedTextField1 ? Colors.blue : Colors.grey[350]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.027,),

                  // password TextField
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
                    elevation: 20.0,
                    shadowColor: Colors.white70,
                    child: TextField(
                      obscureText: true,
                      onTap: () {
                        setState(() {
                          _changedTextField2 = true;
                          _changedTextField1 = false;
                        });
                      },
                      controller: _passwordController,
                      style: TextStyle(color: _changedTextField2 ? Colors.blue : Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey[350]),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                          child: Icon(Icons.lock_open_rounded, color: _changedTextField2 ? Colors.blue : Colors.grey[350]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
                          borderSide: BorderSide(color: Colors.white),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),

                  // Text: Forgot Password?
                  Container(
                    height: MediaQuery.of(context).size.height * 0.057,
                    width: double.infinity,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018,),

                        Text('Forgot Password?   ', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ),

                  // Button: Log in
                  Container(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0619 / 2)
                      ),
                      height: MediaQuery.of(context).size.height * 0.0619,
                      minWidth: MediaQuery.of(context).size.width * 0.498,
                      color: Colors.indigo[600],
                      child: Text('LOG IN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: .7),),
                      onPressed: () {
                        _doLogin();
                      },

                    ),
                  ),

                  // Text: Or connect using
                  Container(
                    height: MediaQuery.of(context).size.height * 0.089,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Or connect using', style: TextStyle(color: Colors.grey[350], fontWeight: FontWeight.w500),),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.021,),
                      ],
                    ),
                  ),

                  // Buttons: Facebook || Google
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Button: Facebook
                        Container(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            height: MediaQuery.of(context).size.height * 0.045,
                            minWidth: MediaQuery.of(context).size.width * 0.323,
                            color: Colors.indigo[600],
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/facebook.svg', color: Colors.white, height: MediaQuery.of(context).size.height * 0.018,),

                                SizedBox(width: 5,),

                                Text('Facebook', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: .7),),
                              ],
                            ),
                            onPressed: () {},

                          ),
                        ),

                        SizedBox(width: MediaQuery.of(context).size.width * 0.0429,),

                        // Button: Google
                        Container(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            height: MediaQuery.of(context).size.height * 0.045,
                            minWidth: MediaQuery.of(context).size.width * 0.323,
                            color: Colors.red,
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/google-plus.svg', color: Colors.white, height: MediaQuery.of(context).size.height * 0.018,),

                                SizedBox(width: 5,),

                                Text('Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: .7),),
                              ],
                            ),
                            onPressed: () {},

                          ),
                        ),
                      ],
                    ),
                  ),

                  // TextDetector: Sign Up
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? '),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, SignupPage.id);
                            },
                            child: Text('Sign Up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
