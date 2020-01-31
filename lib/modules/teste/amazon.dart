import 'package:flutter/material.dart';

class Amazon extends StatefulWidget {
  @override
  _AmazonState createState() => _AmazonState();
}

class _AmazonState extends State<Amazon> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: const Duration(seconds: 5))..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(1, 0.0),
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.elasticOut,
          )),
          child: Container(
            padding: EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      2.0, // Move to right 10  horizontally
                      3.0, // Move to bottom 5 Vertically
                    ),
                  )
              ]
            ),
            width: MediaQuery.of(context).size.width - 100,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Input"
              ),
            ),
          ),
        ),
      ),
    );
  }
}