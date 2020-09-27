import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget{
  final Function(int) ind;
  var menuIndex;

  BottomWidget(this.ind, this.menuIndex);

  @override
  _BottomWidget createState() => _BottomWidget(ind, menuIndex);
}

class _BottomWidget extends State<BottomWidget>{
  int _currentIndex;
  int menuIndex;

  final Function(int) ind;
  _BottomWidget(this.ind, this.menuIndex){
    this._currentIndex = menuIndex;
    print(_currentIndex);
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          ind(index);
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      iconSize: 32.0,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      selectedItemColor: Colors.indigo[600],
      unselectedItemColor: Colors.blueGrey[700],
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 36.0),
          title: Text("home")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text("ddd")
        ),
        //BottomNavigationBarItem(
        //    icon: Icon(Icons.insert_emoticon),
        //    title: Text("ddd")
        //),
        BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text("ddd")
        )
      ],
    );
  }
}