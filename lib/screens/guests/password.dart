import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const PasswordScreen({super.key, required this.onChangedStep});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isSecret = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () => widget.onChangedStep(0), 
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  "password".toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Enter your password"),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        obscureText: _isSecret,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty || value.length < 6){
                            return "Votre mot de passe doit contenir au moins 6 caractères";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              _isSecret = !_isSecret;
                            }),
                            child: Icon(
                              _isSecret ?
                                Icons.visibility_off : Icons.visibility
                            ),
                          ),
                          hintText: "ex : j^dfd'129=23+",
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
                        onPressed: _password == null || _password.isEmpty || _password.length < 6 ? null : () { 
                          if(_formKey.currentState!.validate()){
                            print(_password);
                          }
                        },
                        child: Text('continue'.toUpperCase()),
                      )
                    ],
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