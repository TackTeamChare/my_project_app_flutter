import 'package:blog_app/views/blog_screen_page.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10), // ปรับขอบโค้ง
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // ขอบโค้งบนเวลากด
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30), // ขอบโค้งเมื่อไม่กด
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.red),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10), // ปรับขอบโค้ง
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // ขอบโค้งบนเวลากด
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30), // ขอบโค้งเมื่อไม่กด
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // After successful login, navigate to BlogScreen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BlogScreen();
                    }));
                    // if (_formKey.currentState!.validate()) {
                    //   // You can add login logic here

                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                    ),
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
