import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(),
    );
  }
}

class Scaffold extends StatefulWidget {
  @override
  _ScaffoldState createState() => _ScaffoldState();
}

class _ScaffoldState extends State<Scaffold> {
  double _value = 20.0;

  tabSwitch(int i) {
    switch (i) {
      case 0:
        Text("Articles");
        break;
      case 1:
        Text("Views");
        break;
      case 2:
        Text("Action Picker");
        break;
    }
  }

  actionSheetMethod(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text("Pick me?"),
            message: Text("Choose who?"),
            cancelButton: CupertinoActionSheetAction(
              child: Text("cancel"),
              onPressed: () {

              },
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text("M1"),
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: Text("M2"),
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: Text("M3"),
                onPressed: () {},
              )
            ],
          );
        });
  }

  alertMethod(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Phone is silent"),
          );
        });
  }

  datePickerMethod(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime newdate) {
            print(newdate);
          },
        );
      },
    );
  }

  Widget scaffoldReturn(int i) {
    switch (i) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Enter the Articles"),
            CupertinoTextField(
              autocorrect: true,
              clearButtonMode: OverlayVisibilityMode.always,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            )
          ],
        );
      case 1:
        return Text("Views Pages");
      case 2:
        return Container(
          child: Center(
            child: CupertinoButton(
              color: Colors.blue,
              child: Text("ActionSheet Button"),
              onPressed: () {
                actionSheetMethod(context);
              },
            ),
          ),
        );
      case 3:
        return Container(
          child: Center(
            child: CupertinoButton(
              color: Colors.blue,
              child: Text("Pick Date"),
              onPressed: () {
                datePickerMethod(context);
              },
            ),
          ),
        );
      case 4:
        return Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "Volume Control",
                  style: TextStyle(fontSize: 45),
                ),
              ),
              Center(
                child: CupertinoSlider(
                  value: _value,
                  min: 0,
                  max: 100,
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
              Center(
                child: CupertinoButton(
                  color: Colors.redAccent,
                  child: Text("Volume Off"),
                  onPressed: () {
                    alertMethod(context);
                  },
                ),
              )
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Articls'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text("ActionSheet"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.time),
            title: Text("Date Picker"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.volume_up),
            title: Text("Volume Off"),
          )
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                child: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              middle: tabSwitch(i),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Scrollbar(child: scaffoldReturn(i))],
            ));
      },
    );
  }
}
