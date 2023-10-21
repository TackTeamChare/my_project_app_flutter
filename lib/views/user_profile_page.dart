import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final TextEditingController _passwordController = TextEditingController();
  bool _isDeletingAccount = false;

  String firstName = 'John';
  String lastName = 'Doe';
  String name = 'johndoe123';
  String email = 'johndoe@example.com';
  String password = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: FormBuilder(
        key: _fbKey,
        initialValue: {
          'firstName': firstName,
          'lastName': lastName,
          'name': name,
          'email': email,
          'password': password,
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              SizedBox(height: 16),
              FormBuilderTextField(
                name: 'firstName',
                decoration: InputDecoration(labelText: 'ชื่อ'),
              ),
              FormBuilderTextField(
                name: 'lastName',
                decoration: InputDecoration(labelText: 'นามสกุล'),
              ),
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(labelText: 'ชื่อผู้ใช้'),
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(labelText: 'อีเมล'),
                // validator: FormBuilderValidators.email,
              ),
              // FormBuilderTextField(
              //   name: 'password',
              //   decoration: InputDecoration(labelText: 'รหัสผ่าน'),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_fbKey.currentState!.saveAndValidate()) {
                        final formData = _fbKey.currentState!.value;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('บันทึกข้อมูลสำเร็จ'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // สีของปุ่ม "บันทึก"
                    ),
                    child: Text(
                      'อัพเดท',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _showChangePasswordDialog,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // เปลี่ยนสีปุ่มตามที่คุณต้องการ
                    ),
                    child: Text(
                      'เปลี่ยนรหัสผ่าน',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  if (!_isDeletingAccount)
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('ยืนยันการลบบัญชีผู้ใช้'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      'กรุณาป้อนรหัสผ่านเพื่อยืนยันการลบบัญชี'),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration:
                                        InputDecoration(labelText: 'รหัสผ่าน'),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('ยกเลิก'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final enteredPassword =
                                        _passwordController.text;
                                    final correctPassword = 'รหัสผ่านของคุณ';

                                    if (enteredPassword == correctPassword) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('บัญชีผู้ใช้ถูกลบแล้ว'),
                                        ),
                                      );
                                      setState(() {
                                        _isDeletingAccount = true;
                                      });
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('รหัสผ่านไม่ถูกต้อง'),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .red, // สีของปุ่ม "ลบบัญชีผู้ใช้งาน"
                                  ),
                                  child: Text(
                                    'ลบบัญชี',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 0, 0),
                      ),
                      child: Text(
                        'ลบบัญชีผู้ใช้งาน',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ป้อนรหัสผ่านใหม่'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text('กรุณาป้อนรหัสผ่านใหม่'),
              FormBuilderTextField(
                name: 'newPassword',
                obscureText: true, // ทำให้เป็นรหัสผ่าน
                decoration: InputDecoration(labelText: 'รหัสผ่านใหม่'),
              ),
              FormBuilderTextField(
                name: 'confirmPassword',
                obscureText: true, // ทำให้เป็นรหัสผ่าน
                decoration: InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                // ตรวจสอบรหัสผ่านใหม่และรหัสผ่านยืนยันที่นี่
                final newPassword = _fbKey.currentState!.value['newPassword'];
                final confirmPassword =
                    _fbKey.currentState!.value['confirmPassword'];

                if (newPassword == confirmPassword) {
                  // ทำสิ่งที่คุณต้องการเมื่อรหัสผ่านถูกต้อง
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('รหัสผ่านถูกเปลี่ยนแล้ว'),
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  // ทำสิ่งที่คุณต้องการเมื่อรหัสผ่านไม่ตรงกัน
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('รหัสผ่านไม่ตรงกัน'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('บันทึกรหัสผ่าน'),
            ),
          ],
        );
      },
    );
  }
}
