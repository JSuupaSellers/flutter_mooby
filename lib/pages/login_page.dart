import 'package:flutter/material.dart';
import '../ui/signup_form_overlay.dart';
import '../model/login_data.dart';
import '../util/login_validator.dart';
import '../ui/login_form_overlay.dart';
class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  bool loginOverlayVisible = false;
  bool signupOverlayVisible = false;


  void toggleLoginOverlay(bool isOpen){
    this.setState((){
      isOpen == true  ? loginOverlayVisible = true : loginOverlayVisible = false;
    });
  }
  void toggleSignupOverlay(bool isOpen){
    this.setState((){
      isOpen == true ? signupOverlayVisible = true : signupOverlayVisible = false;
    });
  }

  @override
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size;

    var assetsImage = new AssetImage('images/mooby_logo.png');
    var image = new Image(image: assetsImage);

    return new Container(
      decoration: new BoxDecoration(
        color: const Color(0xFF23272A),
      ),
      child: new Stack(
        children: <Widget>[
        new Scaffold(
          resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: new Column(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(top:  100.0),
                  height: 200.0,
                  width: 250.0,
                  child: new DecoratedBox(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage('images/mooby_logo.png')
                      )
                    ),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 10.0,top: 100.0,right: 10.0,bottom: 0.0),
                  width: screenSize.width,
                  color: Colors.white,
                  padding: new EdgeInsets.symmetric(vertical: 5.0),
                  child: new FlatButton(
                      onPressed: null,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.symmetric(horizontal: 10.0),
                              width: 25.0,
                              height: 25.0,
                              child: new DecoratedBox(
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        image: new AssetImage('images/facebook_icon.png')
                                    )
                                ),
                              ),
                            ),
                            new Text(
                              'Log in with Facebook',
                              style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: const Color(0xFF3B5998)),
                            )
                            ],
                        )
                      ],
                    ),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.symmetric(vertical: 30.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            height: .5,
                            width: 175.0,
                            color: Colors.white70,
                          ),
                          new Container(
                            margin: new EdgeInsets.symmetric(horizontal: 4.0),
                            child: new Material(
                              color: Colors.transparent,
                                child: new Text(
                                'OR',
                                style: new TextStyle(fontSize: 15.0, color: Colors.white70, fontStyle: FontStyle.italic),
                                )
                            )
                          ),
                          new Container(
                            height: .5,
                            width: 175.0,
                            color: Colors.white70,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Material(
                          color: Colors.transparent,
                          child: new FlatButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () => toggleSignupOverlay(true),
                            child: new Text(
                              'Sign up with email and password',
                              style: new TextStyle(fontSize: 15.0, color: Colors.white70, fontWeight: FontWeight.bold),
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
          bottomNavigationBar: new Container(
                padding: new EdgeInsets.all(10.0),
                color: Colors.black26,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        'Already have an account? ',
                        style: new TextStyle(fontSize: 12.0, color: Colors.white70),
                      ),
                    ),
                    new ButtonTheme(
                      minWidth: 1.0,
                      padding: new EdgeInsets.all(0.0),
                        child: new FlatButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () => toggleLoginOverlay(true),
                            child: new Text(
                            'Log in.',
                          style: new TextStyle(fontSize: 12.0,color: const Color(0xFFBC2025), fontWeight: FontWeight.bold),
                        ))
                    )
                  ],
                )
            ),
          ),
          loginOverlayVisible == true ? new LoginForm(
              screenSize.width,
              () => toggleLoginOverlay(false)
          ) : new Container(),
          signupOverlayVisible == true ? new SignupForm(
              screenSize.width,
              () => toggleSignupOverlay(false)
          ) : new Container()
      ]
      )
    );

  }
}