import 'package:blog_app/models/article.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:image_picker/image_picker.dart';

class EditTopicForm extends StatefulWidget {
  final Article article; // รับ Article ที่ต้องการแก้ไข

  const EditTopicForm({Key? key, required this.article}) : super(key: key);

  @override
  State<EditTopicForm> createState() => _EditTopicFormState(article: article);
}

class _EditTopicFormState extends State<EditTopicForm> {
  final _formKey = GlobalKey<FormState>();
  final Article article;
  XFile? _image;
  String? _category;

  _EditTopicFormState({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขกระทู้'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'แก้ไขกระทู้',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
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
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  initialValue: article.title, // ตั้งค่าค่าเริ่มต้น
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
                  // ตั้งค่าค่าเริ่มต้น
                  // initialValue: article.category ?? 'หมวดหมู่ 1',
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
                  initialValue: article.content, // ตั้งค่าค่าเริ่มต้น
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
                    primary: Colors.blue,
                    onPrimary: Colors.white,
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
                SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('แก้ไขกระทู้สำเร็จ');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'บันทึก',
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
