import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_youtube/profile.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstaHome(),
    );
  }
}

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          _getPostsList(context),
          _getHeader(context),
          _getBottomBarShadow(context),
          _getBottomBar(context),
        ],
      ),
    );
  }
}

_getBottomBarShadow(context) {
  return Positioned(
    bottom: 0,
    child: Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.grey.withOpacity(0.8),
            Colors.grey.withOpacity(0.01),
          ])),
    ),
  );
}

_getHeader(context) {
  return Positioned(
    top: 0,
    child: Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/camera.png', width: 30),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset('assets/live.png', width: 30),
                      Image.asset('assets/dm.png', width: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _getNewStoryBtn(),
                _getUserStory(
                    image: AssetImage('assets/face1.jpg'), newStory: false),
                _getUserStory(
                    image: AssetImage('assets/face2.jpg'), newStory: true),
                _getUserStory(
                    image: AssetImage('assets/face3.jpg'), newStory: true),
                _getUserStory(
                    image: AssetImage('assets/face4.jpg'), newStory: false),
                _getUserStory(
                    image: AssetImage('assets/face5.jpg'), newStory: true),
                _getUserStory(
                    image: AssetImage('assets/face6.jpg'), newStory: true),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

_getPostsList(context) {
  return Container(
    color: Colors.grey.withOpacity(0.35),
    child: ListView(
      padding: EdgeInsets.only(top: 165),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _getPost(
          image: AssetImage('assets/third.jpg'),
          name: 'Jennifer_Cole',
          avatar: AssetImage('assets/face.jpg'),
          context: context,
        ),
        _getPost(
          image: AssetImage('assets/second.jpg'),
          name: 'Peter_Range',
          avatar: AssetImage('assets/face5.jpg'),
          context: context,
        ),
        _getPost(
          image: AssetImage('assets/first.jpg'),
          name: 'SmartFox',
          avatar: AssetImage('assets/face4.jpg'),
          context: context,
        ),
        SizedBox(
          height: 100,
        )
      ],
    ),
  );
}

_getPost({ImageProvider image, String name, ImageProvider avatar, context}) {
  return Container(
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(15),
    height: 450,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(radius: 18, backgroundImage: avatar),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Icon(Icons.more_horiz)
          ],
        ),
        Container(
          height: 330,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.redAccent),
            Text(
              ' 1,254',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.chat_bubble_outline),
            Text(
              ' 54',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Expanded(child: Container()),
            Icon(Icons.bookmark_border),
          ],
        )
      ],
    ),
  );
}

_getNewStoryBtn() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: <Widget>[
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(50)),
      ),
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 23,
      ),
      CircleAvatar(
        backgroundImage: AssetImage('assets/face.jpg'),
        radius: 20,
      ),
      CircleAvatar(
        backgroundColor: Colors.blueAccent.shade700.withOpacity(.6),
        radius: 20,
      ),
      Text(
        '+',
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
      ),
    ],
  );
}

_getUserStory({ImageProvider image, bool newStory}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              gradient: newStory
                  ? LinearGradient(
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                      colors: [
                          Colors.orange.shade400,
                          Colors.pink,
                        ])
                  : null,
              borderRadius: BorderRadius.circular(50)),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 23,
        ),
        CircleAvatar(
          backgroundImage: image,
          radius: 20,
        ),
      ],
    ),
  );
}

_getBottomBar(context) {
  return Positioned(
    bottom: 0,
    child: ClipPath(
      clipper: BottomBarClipper(),
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.home, size: 28),
              Icon(Icons.search, size: 28),
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.orange.shade400.withOpacity(.6),
                        Colors.pink,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrangeAccent.shade100.withOpacity(.6),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(Icons.add, color: Colors.grey.shade300),
              ),
              Icon(Icons.favorite_border, size: 28),
              Icon(Icons.perm_identity, size: 28),
            ],
          ),
        ),
      ),
    ),
  );
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.moveTo(0, sh * 0.35);
    path.lineTo(sw * 0.3, sh * 0.35);
    path.cubicTo(sw * 0.4, sh * 0.35, sw * 0.4, 0, sw * 0.5, 0);
    path.cubicTo(sw * 0.6, 0, sw * 0.6, sh * 0.35, sw * 0.7, sh * 0.35);
    path.lineTo(sw, sh * 0.35);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
