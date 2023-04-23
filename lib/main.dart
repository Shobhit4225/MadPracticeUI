import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:uiforexams/navigationcode.dart';
import 'package:uiforexams/stop_watch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(16.0), // Add margin around the container
            child: Column(
              children: [
                Image.network(
                  'https://images.pexels.com/photos/2263436/pexels-photo-2263436.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  // Replace with your image URL
                  width: 400, // Set the width of the image
                  height: 180, // Set the height of the image
                  fit: BoxFit
                      .cover, // Set the fit property to control how the image is displayed
                ),
                SizedBox(height: 16.0), // Add spacing after the image
                const Text(
                  'Upcoming Events',
                  textAlign: TextAlign.left, // Set text alignment to center
                  style: TextStyle(
                    color: Colors.blue, // Set text color to blue
                    fontSize: 14.0, // Set text size to 24.0
                    fontWeight: FontWeight.bold, // Set text weight to bold
                  ),
                  textScaleFactor: 1.5, // Set text scale factor to 1.5 (150%)
                ),
                CarouselSlider(
                  options: CarouselOptions(

                    height: 200,
                    // Set the height of the carousel
                    initialPage: 0,
                    // Set the initial page
                    enableInfiniteScroll: true,
                    // Set to true for infinite scrolling
                    autoPlay: true,
                    // Set to true for auto-play
                    autoPlayInterval: Duration(seconds: 3),
                    // Set the auto-play interval
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    // Set the auto-play animation duration
                    autoPlayCurve: Curves.fastOutSlowIn,
                    // Set the auto-play animation curve
                    enlargeCenterPage: true,
                    // Set to true to enlarge the center page
                    onPageChanged: (index, reason) {
                      // Callback function for page change
                      print('Page changed: $index');
                    },
                  ),
                  items: [
                    // Add the carousel items
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Set the desired corner radius here
                      child: Image.network(
                          'https://images.pexels.com/photos/2263410/pexels-photo-2263410.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          fit: BoxFit.cover),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Set the desired corner radius here
                      child: Image.network(
                          'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          fit: BoxFit.cover),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Set the desired corner radius here
                      child: Image.network(
                          'https://images.pexels.com/photos/2263410/pexels-photo-2263410.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(16.0), // Set the margin for the card
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), // Set the corner radius for the card
                    color: Colors.yellowAccent, // Set the background color of the card
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Set the shadow color of the card
                        offset: Offset(0, 4), // Set the offset of the shadow
                        blurRadius: 4.0, // Set the blur radius of the shadow
                        spreadRadius: 2.0, // Set the spread radius of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4.0, // Set the elevation of the card
                        shadowColor: Colors.yellowAccent, // Set the shadow color of the card
                        color: Colors.yellowAccent, // Set the background color of the card
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Set the desired corner radius here
                              child: Image.network(
                                  'https://images.pexels.com/photos/2263410/pexels-photo-2263410.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Card Title',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Some quick example text to build on the card title and make up the bulk of the card\'s content.',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(height: 16.0),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    // Set alignment to right
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Add your onPressed logic here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => NavigationPage()),
                                        );

                                      },
                                      child: Text('Go somewhere'),
                                    ),
                                  ),
                                  SizedBox(height: 7.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFAC6DDC), Color(0xFFF68BFB)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 220, // Set the width of the container
                  height: 220, // Set the height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Set the shape of the container to a circle
                    image: DecorationImage(
                      // Set the image as the background of the container
                      image: NetworkImage(
                        'https://img.freepik.com/free-vector/customer-support-flat-illustration_23-2148892786.jpg?w=996&t=st=1682158618~exp=1682159218~hmac=11362d9b5594acbbfd944075e0bad48887b190705c1c4c9be6b275dffcce3b9a',
                      ),
                      fit: BoxFit.cover, // Set the fit property to control how the image is displayed
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'Welcome to My App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'A Flutter App Template',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48.0),
                ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StopwatchHomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),

                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18.0,
                      color: Colors.black),
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

