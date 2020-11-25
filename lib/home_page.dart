import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocityx_animated_page_view/velocityx_animated_page_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VxAppBar(
          title: Text("VelocityX Animated Page View Demo",
            style: TextStyle(color: Colors.grey[200],
            fontSize: 20
            ),
          ),
          //centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: VStack([
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
                child: Text("Swipe image to show animated page view",
                  style: TextStyle(fontSize: 16),)
            ),
          ),
          VelocityXAnimatedPageView()
        ])..p16().scrollVertical(),
    );
  }
}
