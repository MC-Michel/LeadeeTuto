import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const TermScreen({super.key, required this.onChangedStep});

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  bool _termIsReaded = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if(!_scrollController.position.outOfRange && _scrollController.offset >= _scrollController.position.maxScrollExtent){
        setState(() {
          _termIsReaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("Terms & Conditions",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () => widget.onChangedStep(0), 
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
            top : 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu mi a sapien eleifend laoreet. Sed eu felis a dui maximus placerat. Nulla facilisi. Ut sit amet congue ex, vitae aliquam urna. Etiam a augue tincidunt, pellentesque ante et, gravida est. Suspendisse et ligula fermentum, consequat nulla et, vulputate dolor. Nunc ut sapien nulla."),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))
                ),
                onPressed : !_termIsReaded ? null : () {
                  print("Accecpt");
                  widget.onChangedStep(2);
                },
                child: Text(
                  "accept & continue".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}