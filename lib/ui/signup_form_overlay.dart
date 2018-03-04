import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  final double width;
  final VoidCallback _onSignUpTap;
  SignupForm(this.width, this._onSignUpTap);

  @override
  State createState() => new SignupFormState();
}

class SignupFormState extends State<SignupForm> with SingleTickerProviderStateMixin{

  Animation<double> _containerContentsOpacity;
  Animation<Offset> _containerContentsPosition;
  AnimationController _containerSlideInAnimationController;

  @override
  void initState(){
    super.initState();
    _containerSlideInAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    _containerContentsOpacity = new CurvedAnimation(parent: new ReverseAnimation(_containerSlideInAnimationController), curve: Curves.fastOutSlowIn);
    _containerContentsPosition = new Tween<Offset> (
        begin: const Offset(1.0, 0.0),
        end: Offset.zero
    ).animate(new CurvedAnimation(parent: _containerSlideInAnimationController, curve: Curves.fastOutSlowIn));
    _containerSlideInAnimationController.forward();
  }

  @override
  void dispose(){
    _containerSlideInAnimationController.dispose();
    super.dispose();
  }

  void slideOut(){
    _containerSlideInAnimationController.reverse().whenComplete(widget._onSignUpTap);
  }

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: slideOut,
        child: new SlideTransition(
            position: _containerContentsPosition,
          child: new Form(
            key: widget.key,
            child: new Container(
              padding: new EdgeInsets.all(25.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Material(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: const Color(0xFFFFFFFF),
                    child: new Container(
                      padding: new EdgeInsets.all(20.0),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Icon(Icons.account_circle, size: 60.0, color: const Color(0xFFBC2025),),
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                              hintText: 'you@example.com',
                              labelText: 'email'
                            ),
                            onFieldSubmitted: (String value){
                              print("submitted");
                            },
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                                hintText: 'you@example.com',
                                labelText: 'confirm email'
                            ),
                          ),
                          new TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                                hintText: 'password',
                                labelText: 'password'
                            ),
                          ),
                          new TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                                hintText: 'password',
                                labelText: 'confirm password'
                            ),
                          ),
                          new Container(
                            margin: new EdgeInsets.only(top: 10.0),
                            width: widget.width,
                            child: new RaisedButton(
                              onPressed: () => null,
                              child: new Text(
                                'sign up',
                                style: new TextStyle(color: Colors.white,fontFamily: 'Comfortaa'),
                              ),
                              color: const Color(0xFFBC2025),
                            ),

                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}