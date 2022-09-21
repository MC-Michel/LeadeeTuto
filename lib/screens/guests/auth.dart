import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const AuthScreen({super.key, required this.onChangedStep});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp _emailRegex = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");

  String _email = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body : Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: TextSpan(
                  text: "Everyone has\n".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: "knowledge\n".toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: "to share\n".toUpperCase()
                    )
                  ],
                )),
                Text(
                  "It all start here",
                  style: TextStyle(
                    fontStyle: FontStyle.italic
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Enter your email"),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty || !_emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "ex : john.doe@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Colors.grey)
                          )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                        ),
                        onPressed: _email == null || _email.isEmpty || !_emailRegex.hasMatch(_email) ? null : () { 
                          if(_formKey.currentState!.validate()){
                            print(_email);
                            widget.onChangedStep(1);
                          }
                        },
                        child: Text('continue'.toUpperCase()),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}