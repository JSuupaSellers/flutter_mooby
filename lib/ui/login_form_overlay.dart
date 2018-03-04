import 'package:flutter/material.dart';
import '../util/login_validator.dart';

class LoginForm extends StatefulWidget {


  final double width;
  final VoidCallback _onSignUpTap;
  LoginForm(this.width,this._onSignUpTap);

  @override
  State createState() => new LoginFormState();



}
class LoginFormState extends State<LoginForm> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Animation<double> _containerContentsOpacity;
  Animation<Offset> _containerContentsPosition;
  AnimationController _containerSlideInAnimationController;

  @override
  void initState(){
    super.initState();
    _containerSlideInAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    _containerContentsOpacity = new CurvedAnimation(parent: new ReverseAnimation(_containerSlideInAnimationController), curve: Curves.fastOutSlowIn);
    _containerContentsPosition = new Tween<Offset> (
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero
    ).animate(new CurvedAnimation(parent: _containerSlideInAnimationController, curve: Curves.fastOutSlowIn));
    _containerSlideInAnimationController.forward();
  }

  @override
  void dispose(){
    _containerSlideInAnimationController.dispose();
    super.dispose();
  }

  void login(){
    if(this._formKey.currentState.validate()){
      _formKey.currentState.save();
      print("login was tried");
    }
  }

  void slideOut(){
    _containerSlideInAnimationController.reverse().whenComplete(widget._onSignUpTap);
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child:  new InkWell(
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
                                  child: new Icon(Icons.exit_to_app, size: 60.0, color: const Color(0xFFBC2025),),
                                ),
                                new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: new InputDecoration(
                                      hintText: 'you@example.com',
                                      labelText: 'email',
                                    ),
                                    validator: LoginValidator.validateEmail,
                                    onFieldSubmitted: (String value) {
                                      print("submitted");
                                    }
                                ),
                                new TextFormField(
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                      hintText: "password",
                                      labelText: "password"
                                  ),
                                  validator: LoginValidator.validatePassword,
                                  onFieldSubmitted: (String value) {
                                    print("submitted");
                                  },
                                ),
                                new Container(margin: new EdgeInsets.only(top: 10.0),),
                                new Container(
                                  width: widget.width,
                                  child: new RaisedButton(
                                    onPressed: () => login(),
                                    child: new Text(
                                      'log in',
                                      style: new TextStyle(color: Colors.white,fontFamily: 'Comfortaa'),
                                    ),
                                    color: const Color(0xFFBC2025),
                                  ),

                                ),
                                new Container(padding: new EdgeInsets.only(top: 10.0),),
                              ]
                          ),
                        )
                    )
                  ],
                ),
              )
          )
        )
        )



    );

  }
}
