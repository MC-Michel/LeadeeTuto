import 'package:flutter/material.dart';
import 'package:leadeetuto2/screens/guests/auth.dart';
import 'package:leadeetuto2/screens/guests/password.dart';
import 'package:leadeetuto2/screens/guests/term.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _widgets.addAll([
      AuthScreen(
        onChangedStep : (index) => setState(() => _indexSelected = index,)
      ),
      TermScreen(
        onChangedStep : (index) => setState(() => _indexSelected = index,)
      ),
      PasswordScreen(
        onChangedStep : (index) => setState(() => _indexSelected = index,)
      )
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected)
    );
  }
}