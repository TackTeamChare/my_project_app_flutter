import 'package:blog_app/models/article.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:photo_view/photo_view.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              article.content,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // แสดงรูปภาพในรูปแบบแกลเลอรี่
            Container(
              height: 300, // ปรับความสูงตามความเหมาะสม
              // child: PhotoView(
              //   imageProvider: AssetImage(article.imageUrl[0]),
              //   backgroundDecoration: BoxDecoration(
              //     color: Colors.black,
              //   ),
              // ),
            ),
            // Wrap(
            //   alignment: WrapAlignment.start,
            //   children: article.imageUrl.map((imageUrl) {
            //     return Container(
            //       margin: EdgeInsets.all(4),
            //       width: 80,
            //       height: 80,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //       child: Image.asset(
            //         imageUrl,
            //         width: 80,
            //         height: 80,
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   }).toList(),
            // ),
            ElevatedButton(
              onPressed: () {
                // สร้างข้อความที่คุณต้องการแชร์
                String shareText = "${article.title}\n\n${article.content}";

                // ใช้ social_share เพื่อแชร์ข้อความ
                SocialShare.shareOptions(shareText).then((data) {
                  print("แชร์สำเร็จ: $data");
                }).catchError((error) {
                  print("เกิดข้อผิดพลาดในการแชร์: $error");
                });

// SocialShare.shareOptions(shareText).then((data) {
//   // ตรวจสอบสถานะการแชร์และแพลตฟอร์มที่ผู้ใช้เลือก
//   if (data == "Facebook") {
//     // ผู้ใช้เลือกแชร์บน Facebook
//     // ดำเนินการตามที่ต้องการ เช่น เปิดแอป Facebook หรือทำการแชร์อย่างอื่น
//   } else if (data == "WhatsApp") {
//     // ผู้ใช้เลือกแชร์บน WhatsApp
//     // ดำเนินการตามที่ต้องการ เช่น เปิดแอป WhatsApp หรือทำการแชร์อย่างอื่น
//   } else {
//     // ผู้ใช้เลือกแชร์บนแพลตฟอร์มอื่น ๆ
//     // ดำเนินการตามที่ต้องการสำหรับแพลตฟอร์มที่ไม่รู้จัก
//   }
// }).catchError((error) {
//   print("เกิดข้อผิดพลาดในการแชร์: $error");
// });
              },
              child: Text("แชร์บทความ"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 0, 162, 255), // เปลี่ยนสีปุ่ม
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // ปรับขอบของปุ่ม
                  ),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12)), // ปรับรูปร่างขอบของปุ่ม
                overlayColor:
                    MaterialStateProperty.all(Colors.grey[300]), // เพิ่มสีขอบ
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1.0)), // เพิ่มขนาดขอบ
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoView {}
