import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isObscure = true;
  String username, password;
  Widget loginChild = LoginButton();

  void showLoader() {
    setState(() {
      loginChild = Spinner();
    });
  }

  void hideLoader() {
    setState(() {
      loginChild = LoginButton();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0562A7),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/dh.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Doc ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Pacifico',
                                  color: Color(0xFF0562A7),
                                ),
                              ),
                              Text(
                                'Hub',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Pacifico',
                                  color: Color(0xFF37DBFF),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF37DBFF),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'To continue with your account',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF37DBFF),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: TextField(
                            onChanged: (value) {
                              username = value;
                            },
                            style: TextStyle(color: Color(0xFF0562A7)),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter username',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF37DBFF)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0562A7)),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: isObscure,
                            style: TextStyle(color: Color(0xFF0562A7)),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                              ),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF37DBFF)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0562A7)),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '?Forgot Password',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Color(0xFF37DBFF),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            showLoader();
                            // print("Username ->$username\nPassword ->$password");
                            var url = Uri.parse(
                                'https://dattarubberindustries.com/api/login.php');
                            var response = await http.post(url, body: {
                              'usr_email': '$username',
                              'usr_pass': '$password'
                            });
                            await Future.delayed(Duration(milliseconds: 3000),
                                () {
                              hideLoader();
                            });

                            if (jsonDecode(response.body)['success'] == 1) {
                              print("Success");
                            } else {
                              print("Failure");
                            }
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFF0562A7),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: loginChild,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // Container(
                        //   width: 250,
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //     color: Color(0xFF37DBFF),
                        //     borderRadius: BorderRadius.circular(30),
                        //   ),
                        //   child: Center(
                        //     child: Text(
                        //       'Request Access',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF0562A7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        ' Sign up',
                        style: TextStyle(
                          color: Color(0xFF37DBFF),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Spinner extends StatelessWidget {
  const Spinner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
