import 'package:flutter/material.dart';
import '../util/login_validator.dart';

class LoginForm extends StatefulWidget {


  final double width;
  final VoidCallback _onSignUpTap;
  LoginForm(this.width,this._onSignUpTap);

  @override
  State createState() => new LoginFormState();



}
class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void login(){
    if(this._formKey.currentState.validate()){
      _formKey.currentState.save();
      print("login was tried");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child:  new InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget._onSignUpTap,
        child: new Form(
            key: widget.key,
            child: new Container(
              padding: new EdgeInsets.all(25.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Material(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: Colors.white,
                      child: new Container(
                        padding: new EdgeInsets.all(20.0),
                        child: new Column(
                            children: <Widget>[
                              new Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, color: const Color(0xFF23272A)),
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
                              new Container(padding: new EdgeInsets.only(top: 10.0),),
                              new Container(
                                width: widget.width,
                                child: new RaisedButton(
                                  onPressed: () => login(),
                                  child: new Text(
                                    'Login',
                                    style: new TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.greenAccent,
                                ),

                              ),
                              new Container(padding: new EdgeInsets.only(top: 10.0),),
                              new Container(
                                width: widget.width,
                                child: new RaisedButton(
                                  onPressed: widget._onSignUpTap,
                                  child: new Text(
                                    'Signup',
                                    style: new TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.redAccent,
                                ),
                              ),
                            ]
                        ),
                      )
                  )
                ],
              ),
            )
        )
        )



    );

  }
}
