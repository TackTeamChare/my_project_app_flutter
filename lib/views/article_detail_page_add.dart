import 'dart:io';
import 'package:blog_app/models/article.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:image_picker/image_picker.dart';

class AddTopicForm extends StatefulWidget {
  final Article article;

  const AddTopicForm({Key? key, required this.article}) : super(key: key);

  @override
  State<AddTopicForm> createState() => _AddTopicFormState(article: article);
}

class _AddTopicFormState extends State<AddTopicForm> {
  final _formKey = GlobalKey<FormState>();
  final Article article;
  XFile? _image;
  String? _category;

  _AddTopicFormState({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มกระทู้'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // ทำให้อยู่ในเส้นเดียวกัน
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Topic',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // จัดให้อยู่ตรงกลาง
                  ),
                ),
                SizedBox(height: 20), // ลดระยะห่างระหว่างข้อมูล
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'กรุณากรอกหัวข้อ'),
                    MinLengthValidator(3,
                        errorText: 'หัวข้อควรมีอย่างน้อย 3 ตัวอักษร'),
                  ]),
                  decoration: InputDecoration(
                    hintText: 'หัวข้อ',
                    labelText: 'หัวข้อ',
                    prefixIcon: Icon(
                      Icons.topic,
                      color: Colors.blue,
                    ),
                    errorStyle: TextStyle(fontSize: 18.0),
                    contentPadding: EdgeInsets.all(15), // ปรับระยะห่าง
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12), // มนต์รอบ
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  items: ['หมวดหมู่ 1', 'หมวดหมู่ 2', 'หมวดหมู่ 3']
                      .map((category) => DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _category = value;
                    });
                  },
                  value: _category,
                  decoration: InputDecoration(
                    labelText: 'หมวดหมู่',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'กรุณากรอกเนื้อหา'),
                    MinLengthValidator(10,
                        errorText: 'เนื้อหาควรมีอย่างน้อย 10 ตัวอักษร'),
                  ]),
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'เนื้อหา',
                    labelText: 'เนื้อหา',
                    prefixIcon: Icon(
                      Icons.text_fields,
                      color: Colors.green,
                    ),
                    errorStyle: TextStyle(fontSize: 18.0),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final image =
                        await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _image = image;
                    });
                  },
                  child: Text('เลือกรูปภาพ'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // สีพื้นหลัง
                    onPrimary: Colors.white, // สีข้อความ
                  ),
                ),
                if (_image != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.file(
                      File(_image!.path),
                      width: 100,
                      height: 100,
                    ),
                  ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('เพิ่มกระทู้สำเร็จ');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // สีพื้นหลัง
                      onPrimary: Colors.white, // สีข้อความ
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'เพิ่มกระทู้',
                        style: TextStyle(color: Colors.white, fontSize: 22),
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
