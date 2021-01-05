import 'package:flutter/material.dart';

import 'ColorSlider.dart';

class ContentColorSheet extends StatefulWidget {
final Color contentcolor;

final void Function(Color) callBackContentColorTapped;
const ContentColorSheet(
      {Key key,
      this.contentcolor,  
      this.callBackContentColorTapped,
      })
      : super(key: key);
 @override
  _ContentColorSheetState createState() => _ContentColorSheetState();


}

class _ContentColorSheetState extends State<ContentColorSheet> {
  var content_color;

  @override
  void initState() {
    content_color = widget.contentcolor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.content_color,
      child: new Wrap(
        children: <Widget>[ new Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              height: 44,
              width: MediaQuery.of(context).size.width,
              child: ColorSlider(
                callBackColorTapped: _changeColor,
                // call callBack from notePage here
                noteColor: content_color, // take color from local variable
              ),
            ),
          )
        ]));
    }
        void _changeColor(Color color) {
    setState(() {
      this.content_color = color;
      widget.callBackContentColorTapped(color);
    });
  }
  }
  
