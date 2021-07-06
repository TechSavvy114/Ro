import 'package:flutter/material.dart';
import 'package:flutter_ro_test/model/NotificationModel.dart';
import 'package:flutter_ro_test/web_services/SignUpService.dart';

class Ven_Notify extends StatefulWidget {
  String session_id;
  List<NotificationData>list;
  Ven_Notify(this.list);

  @override
  _Ven_NotifyState createState() => _Ven_NotifyState();
}

class _Ven_NotifyState extends State<Ven_Notify> {
  @override
  Widget build(BuildContext context) {
    return showOverlayNotification();
  }

  Widget showOverlayNotification() {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notification'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              SignUpService().getClearNotification(widget.session_id);
            },
          )
        ],
      ),
      body:
      widget.list!=null ?
      Card(
         color: Colors.blue[100],
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context,index){
           return ListTile(
              hoverColor: Colors.blueAccent,
              leading: SizedBox.fromSize(
                  size: const Size(30, 30),
                  child: ClipOval(
                      child: Container(
                        color: Colors.black,
                      ))),
              title: Text(widget.list.elementAt(index).title),
              subtitle: Text(widget.list.elementAt(index).message),
              trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    widget.list.removeAt(index);
                    setState(() {
                    });
                  }),
            );
          },
        ),
      ): Center(child: Text('No new notification'))
    );
  }
}
