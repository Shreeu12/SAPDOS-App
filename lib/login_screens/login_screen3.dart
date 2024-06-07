import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              if (constraints.maxWidth >= 600)
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/rscreen1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Sapdos',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getFontSize(context, 44),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF13235A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getFontSize(context, 28),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF13235A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Enter new account’s details',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getFontSize(context, 18),
                            color: Color(0xFF13235A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                        Center(
                          child: SizedBox(
                            width: ResponsiveHelper.isMobile(context) ? 200 : 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Email address/ Phone No.',
                                prefixIcon: Icon(Icons.email), // Add email icon
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                        Center(
                          child: SizedBox(
                            width: ResponsiveHelper.isMobile(context) ? 200 : 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock), // Add lock icon
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              obscureText: !_isPasswordVisible,
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                        Center(
                          child: SizedBox(
                            width: ResponsiveHelper.isMobile(context) ? 200 : 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock), // Add lock icon
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              obscureText: !_isConfirmPasswordVisible,
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 20)),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/screen3');
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF13235A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('SIGN-UP'),
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.getSpacing(context, 10)),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/screen1');
                            },
                            child: Text(
                              'Already on Sapdos? Sign-in',
                              style: TextStyle(
                                color: Color(0xFF13235A),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Screen2(),
  ));
}
