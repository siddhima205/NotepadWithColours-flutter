import 'package:flutter/material.dart';
import 'package:notepad/Helpers/Note.dart';
import 'package:notepad/Helpers/Utility.dart';

import 'NotePage.dart';
import 'StaggeredGridPage.dart';

enum viewType {
  List,
  Staggered
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

 var notesViewType ;
  @override void initState() {
    notesViewType = viewType.Staggered;
  }

 @override
  Widget build(BuildContext context) {
   
    return
       Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(brightness: Brightness.light,
        actions: _appBarActions(),
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Notes"),
      ),
      body: SafeArea(child:   _body(), right: true, left:  true, top: true, bottom: true,),
      bottomSheet: _bottomBar(),
    ); 

  }

    Widget _body() {
   // print(notesViewType);
    return Container(child: StaggeredGridPage(notesViewType: notesViewType,));
  }

  Widget _bottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text(
            "New Note\n",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _newNoteTapped(context),
        )
      ],
    );
  }

   void _newNoteTapped(BuildContext ctx) {
    // "-1" id indicates the note is not new
    var emptyNote = new Note(-1, "", "", DateTime.now(), DateTime.now(), Colors.white,Colors.black);
    Navigator.push(ctx,MaterialPageRoute(builder: (ctx) => NotePage(emptyNote)));
  }

  List<Widget> _appBarActions() {

    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: InkWell(
          child: GestureDetector(
            onTap: () => _toggleViewType() ,
            child: Icon(
              notesViewType == viewType.List ?  Icons.developer_board : Icons.view_headline,
              color: CentralStation.fontColor,
            ),
          ),
        ),
      ),
    ];
}

void _toggleViewType(){
    setState(() {
      CentralStation.updateNeeded = true;
      if(notesViewType == viewType.List)
        {
          notesViewType = viewType.Staggered;

        } else {
        notesViewType = viewType.List;
      }

    });
  }


}