import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isObscure = true;

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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/dh.png',
                        height: 120,
                        width: 120,
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
                          style: TextStyle(color: Color(0xFF0562A7)),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter username',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF37DBFF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF0562A7)),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: TextField(
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
                              borderSide: BorderSide(color: Color(0xFF37DBFF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF0562A7)),
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
                      Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF0562A7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF37DBFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Request Access',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
