import 'package:flutter/material.dart';
import 'package:task_preferences/model/user_model.dart';
import 'package:task_preferences/pages/login_page.dart';
import 'package:task_preferences/servisec/pref_service.dart';

class SignupPage extends StatefulWidget {
  static final String id = 'signup_page';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0627),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

            // IconButton: back
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 24,),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  },
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.061,),

            // Texts: Let's Get Started! || Create an account
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Let\'s Get Started!', style: TextStyle(fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.height * 0.035, letterSpacing: 1.3),),

                  Text('Create an account to Q Allure to get all features', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.015),)
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.046,),

            // fullname TextField
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
              elevation: 20.0,
              shadowColor: Colors.white70,
              child: TextField(
                controller: _fullnameController,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  hintText: 'Full name',
                  hintStyle: TextStyle(color: Colors.grey[350]),
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                    child: Icon(Icons.person),
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

            // email TextField
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
              elevation: 20.0,
              shadowColor: Colors.white70,
              child: TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[350]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                    child: Icon(Icons.email_outlined),
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

            // phone TextField
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
              elevation: 20.0,
              shadowColor: Colors.white70,
              child: TextField(
                controller: _phoneController,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: TextStyle(color: Colors.grey[350]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                    child: Icon(Icons.phone_android_rounded),
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
                controller: _passwordController,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey[350]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                    child: Icon(Icons.lock_open_rounded),
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

            // confirm password TextField
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0755 / 2),
              elevation: 20.0,
              shadowColor: Colors.white70,
              child: TextField(
                obscureText: true,
                controller: _confirmPasswordController,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey[350]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.0755 / 3, right: MediaQuery.of(context).size.height * 0.0755 / 8),
                    child: Icon(Icons.lock_open_rounded),
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

            SizedBox(height: MediaQuery.of(context).size.height * 0.047,),

            // Button: Create
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0619 / 2)
                ),
                height: MediaQuery.of(context).size.height * 0.0619,
                minWidth: MediaQuery.of(context).size.width * 0.498,
                color: Colors.indigo,
                child: Text('CREATE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: .7),),
                onPressed: () {
                  _doSignup();
                },
              ),
            ),

            // TextDetector: Login here
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, LoginPage.id);
                      },
                      child: Text('Login here', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _doSignup() {
    String fullname = _fullnameController.text.toString();
    String email = _emailController.text.toString().trim();
    String phone = _phoneController.text.toString().trim();
    String password = _passwordController.text.toString().trim();

    User user = new User.fromSignup(fullname: fullname, email: email, phone: phone, password: password);
    Prefs.storeUser(user);

    Navigator.pushReplacementNamed(context, LoginPage.id);
  }
}