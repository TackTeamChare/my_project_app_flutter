import 'package:blog_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 0), // ระยะห่างขอบบนและล่าง
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter first named'),
                      MinLengthValidator(3,
                          errorText: 'Minimum 3 character filled name'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter first Name',
                      labelText: 'First name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter last named'),
                      MinLengthValidator(3,
                          errorText:
                              'Last name should be at least 3 characters'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Enter last Name',
                      labelText: 'Last name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter email address'),
                      EmailValidator(errorText: 'Please correct email filled'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter mobile number'),
                      PatternValidator(r'(^[0-9]{10}$)',
                          errorText: 'Enter valid mobile number'),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                      labelText: 'Mobile',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(70, 7, 70, 20),
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            print('form submitted');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(
                      child: Text(
                        'Or Sign Up Using?',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 20, left: 90),
                //     child: Row(
                //       children: [
                //         Container(
                //           height: 40,
                //           width: 40,
                //         ),
                //         Container(
                //           height: 70,
                //           width: 70,
                //         ),
                //         Container(
                //           height: 40,
                //           width: 40,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the Sign In page here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .blue, // Change color to make it look like a link
                          decoration: TextDecoration.underline, // Add underline
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
