import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
 import 'package:my_ideas_today/lessonspage_by_ed.dart';
import 'package:flutter/material.dart';
import 'package:my_ideas_today/admin_login.dart';
import 'package:my_ideas_today/player.dart';
import 'package:my_ideas_today/registration.dart';
// import 'package:kua_app_01/course_upload.dart';
// import 'list.dart';
import 'package:my_ideas_today/chewie_player.dart';
import 'package:my_ideas_today/profile_page.dart';
import 'package:my_ideas_today/newcoursepage2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


String finalPhone='';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: HomeScreenWidget());
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  int _selectedIndex = 0;
  List<String> videoLinks = [];
  List<String> videoTitles = [];

  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  */

  void _onItemTapped(int index) {
    print(index);
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Future getValidationData()async{ 
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var obtainedPhone=sharedPreferences.getString('phone');
    setState((){
      finalPhone = obtainedPhone!;
    });
    print(finalPhone);
  }

  Widget CourseCard(firstName, lastName, courseTitle, imageName,videoLink,Author,Title,LessonTitles,LessonLinks) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Coursepage(LessonLinks,LessonTitles,Author,Title))),
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 150.0,
        width: 170,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("$imageName"),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            "$firstName",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "$lastName",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          //I commented the Divider
          // Divider(
          //   height: 5.0,
          //   thickness: 2.0,
          //   indent: 57,
          //   endIndent: 57,
          //   color: Colors.white,
          // ),
          Text(
            "$courseTitle",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
    // );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('KUA App',style:TextStyle(color: Colors.orange)),backgroundColor:Colors.black, 
              leading: IconButton(
              icon: Icon(Icons.file_upload, color: Colors.white),
              onPressed: () {
        // LoginScreen         setState(() {
        //   widget.videoController.pause();
        //  Navigator.pushNamed(context, '/');
        // });
                Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => 
                            // HomePage()));
                            LoginScreen()
                            // Player()
                              // ChewieDemo()
                            ));
              },),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: ()async {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.remove('phone');
                               Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => 
                            // HomePage()));
                            Registration()));
         
                  await FirebaseAuth.instance.signOut();
                   Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) =>Registration()),(route) => false);
               }
              )
        ],
      ),
      body: ListView(children: [
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Welcome",
              style: TextStyle(
                fontFamily: 'WaterBrush',
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Continue Watching",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                //letterSpacing: 1.0,
                color: Colors.orange,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: FutureBuilder<QuerySnapshot>(
            future:FirebaseFirestore.instance.collection('Course').get() ,
            builder: (context,snapshot) 
            {
              if(snapshot.hasData){
               final documents = snapshot.data?.docs as List;
               ;
                return ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: documents
                    .map((doc) =>
              //new card
              // CourseCard(doc['Author'],doc['Category'], doc['Title'], doc['Photo']),
              CourseCard('','','', doc['Photo'],doc['Videos'],doc['Author'],doc['Titles'],doc['LessonTitles'],doc['LessonLinks']),
              
           
                ).toList());
              }else if (snapshot.hasError) {
            return Text('Its Error!');
          }
          return Center(
              child: CircularProgressIndicator(),
            );
            },
          )
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Popular Classes",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                //letterSpacing: 1.0,
                color: Colors.orange,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
//Some cards go here
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Instructors",
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                //letterSpacing: 1.0,
                color: Colors.orange,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
  //Some cards also go here
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.orange,
            ),
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.account_circle,
              color: Colors.orange,
            ),
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
