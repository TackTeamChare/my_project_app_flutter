
import 'package:blog_app/models/article.dart';
import 'package:blog_app/views/article_detail_page.dart';
import 'package:blog_app/views/article_detail_page_add.dart';
import 'package:blog_app/views/article_detail_page_edit.dart';
import 'package:blog_app/views/user_profile_page.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<Article> articles = []; // รายการบทความ
  TextEditingController searchController =
      TextEditingController(); // ตัวควบคุมสำหรับค้นหา


  
 

  @override
  void initState() {
    super.initState();
    // ตัวอย่างบทความ
    articles = [
      Article(
        title: 'หัวข้อบทความ 1',
        content: 't mi tincidunt tristique.',
        imageUrl: ['assets/images/profile.png', 'assets/images/profile.png'],
      ),
      Article(
        title: 'หัวข้อบทความ 2',
        content:
            'Loet justo ut mi หฟกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกก.',
        imageUrl: [
          'assets/images/profile.png',
        ],
      ),
      // เพิ่มบทความเพิ่มเติมที่นี่
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Blog App',
          style: GoogleFonts.workSans(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector( 
      onTap: () {
      
                                
   
      },
            child: CircleAvatar(
              child: Icon(Icons.person),
              
            ),
          )
        ],
      ),
      drawer: buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'ค้นหาบทความ',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        25.0)), // ปรับรูปร่างขอบตำแหน่งของช่องค้นหา
                  ),
                ),
                onChanged: (query) {
                  // ค้นหาบทความตาม query
                  // อาจจะใช้เมธอดที่จัดการการค้นหาในรายการบทความ
                },
              ),
            ),
            // รายการบทความแสดงเป็นการ์ด
            // List of Articles
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  Article article = articles[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        article.content,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Wrap(
                        alignment: WrapAlignment.start,
                        children: article.imageUrl.map((imageUrl) {
                          return Container(
                            margin: EdgeInsets.all(4),
                            width: 80,
                            height: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                  imageUrl,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ArticleDetailPage(article: article);
                        }));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                  radius: 40,
                ),
                SizedBox(height: 10),
                Text(
                  'TackTeam',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'chare.a@ku.th',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserProfilePage();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Topic-Add'),
            onTap: () {
              Article newArticle = Article(
                title: 'หัวข้อบทความ',
                content: 'เนื้อหาบทความ',
                imageUrl: ['assets/images/profile.png'],
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddTopicForm(article: newArticle);
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Topic-Edit'),
            onTap: () {
              Article newArticle = Article(
                title: 'หัวข้อบทความ',
                content: 'เนื้อหาบทความ',
                imageUrl: ['assets/images/profile.png'],
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditTopicForm(article: newArticle);
              }));
            },
          ),
          Divider(),
          // Add more menu items here
        ],
      ),
    );
  }
}
