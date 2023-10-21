import 'package:blog_app/models/article.dart';
import 'package:blog_app/views/article_detail_page_add.dart';
import 'package:blog_app/views/article_detail_page_edit.dart';
import 'package:blog_app/views/login.dart';
import 'package:blog_app/views/register.dart';
import 'package:blog_app/views/user_profile_page.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 129, 129, 129),
        centerTitle: true,
      ),
      drawer: buildDrawer(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(90, 80, 90, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'เเอพอะไรก็ไม่รู้',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Welcome to วัยรุ่นไทย!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Image.asset("assets/images/logo.jpg"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("Login", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Register", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }));
                  },
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //     icon: Icon(Icons.add),
              //     label: Text("Topic-Add", style: TextStyle(fontSize: 20)),
              //     onPressed: () {
              //       Article newArticle = Article(
              //         title: 'หัวข้อบทความ',
              //         content: 'เนื้อหาบทความ',
              //         imageUrl: '',
              //       );

              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return AddTopicForm(article: newArticle);
              //       }));
              //     },
              //   ),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //     icon: Icon(Icons.edit),
              //     label: Text("Topic-Edit", style: TextStyle(fontSize: 20)),
              //     onPressed: () {
              //       Article newArticle = Article(
              //         title: 'หัวข้อบทความ',
              //         content: 'เนื้อหาบทความ',
              //         imageUrl: '',
              //       );

              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return EditTopicForm(article: newArticle);
              //       }));
              //     },
              //   ),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //     icon: Icon(Icons.person),
              //     label: Text("Profile", style: TextStyle(fontSize: 20)),
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return UserProfilePage();
              //       }));
              //     },
              //   ),
              // ),
            ],
          ),
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
          // ListTile(
          //   leading: Icon(Icons.login),
          //   title: Text('Login'),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return LoginScreen();
          //     }));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.add),
          //   title: Text('Register'),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return RegisterScreen();
          //     }));
          //   },
          // ),
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
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserProfilePage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
