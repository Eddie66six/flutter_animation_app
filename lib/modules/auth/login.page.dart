import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  //logo
  AnimationController logoAnimationController;
  Animation<double> logoMarginTopAnimation;
  double logoMarginTop = 0.0;
  //form
  AnimationController formAnimationController;
  Animation<double> formOpacityAnimation;
  double formOpacity = 0.0;

  //altura do arquivo do logo
  double logoHeight = 150.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, (){
      var mediaQueryData = MediaQuery.of(context);
      _initLogoAnimation(mediaQueryData);
      _initFormAnimation();
    });
  }

  @override
  void dispose() {
    super.dispose();
    logoAnimationController.dispose();
    formAnimationController.dispose();
  }

  _initLogoAnimation(MediaQueryData mediaQueryData){
    logoAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    logoMarginTopAnimation = Tween<double>(begin: mediaQueryData.size.height/2 - logoHeight/2, end: mediaQueryData.padding.top).animate(logoAnimationController);
    logoAnimationController.addListener((){
      setState(() {
        logoMarginTop = logoMarginTopAnimation.value;
        if(logoAnimationController.status == AnimationStatus.completed){
          logoMarginTop = mediaQueryData.padding.top;
          formAnimationController.forward();
        }
      });
    });
    logoAnimationController.forward();
  }

  _initFormAnimation(){
    formAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    formOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(formAnimationController);
    formAnimationController.addListener((){
      setState(() {
        formOpacity = formOpacityAnimation.value;
        if(formAnimationController.status == AnimationStatus.completed){
          formOpacity = 1;
        }
      });
    });
  }

  _buildForm(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Opacity(
        opacity: formOpacity,
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration:InputDecoration(hintText: "E-Mail"),
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration:InputDecoration(hintText: "Senha"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: RaisedButton(
                onPressed: (){},
                child: Text("Entrar"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text("Esqueci a senha"),
            ),
            Container(
              child: Text("Não tenho cadastro"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top: logoMarginTop),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //logo
            Container(
              height: logoHeight,
              width: 200,
              child: Image.asset("assets/logo.jpg"),
            ),
            //form
            _buildForm()
          ],
        ),
      ),
    );
  }
}