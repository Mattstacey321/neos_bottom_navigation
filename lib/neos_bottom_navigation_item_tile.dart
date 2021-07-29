import 'package:flutter/material.dart';
import 'neos_bottom_navigation_item.dart';

class NeosBottomNavigationItemTile extends StatefulWidget {
  NeosBottomNavigationItemTile(
      this.item,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.itemOutlineColor,
      this.backgroundColor,
      this.itemBackgroudnColor,
      this.index,
      this.onChanged,
      this.currentIndex,
      this.selectedNavColor,
      this.activeColor,
      this.inActiveColor);
  final NeosBottomNavigationItem item;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color itemOutlineColor;
  final Color backgroundColor;
  final Color itemBackgroudnColor;
  final Gradient selectedNavColor;
  final Color activeColor;
  final Color inActiveColor;

  final int index;
  final ValueChanged<int> onChanged;

  final int currentIndex;
  @override
  _NeosBottomNavigationItemTileState createState() => _NeosBottomNavigationItemTileState();
}

class _NeosBottomNavigationItemTileState extends State<NeosBottomNavigationItemTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectItem,
      child: Container(
        height: 100,
        width: widget.currentIndex == widget.index ? 60 : 56,
        child: _buildItem(),
      ),
    );
  }

  Widget _buildItem() {
    Widget icon;

    icon = Container(
      // padding: EdgeInsets.all(0.0),
      child: Container(
        width: widget.currentIndex == widget.index ? 60 : 56,
        height: widget.currentIndex == widget.index ? 60 : 56,
        // con trỏ button bottom Navigation bar
        decoration: BoxDecoration(
          gradient: widget.currentIndex == widget.index ? widget.selectedNavColor : null,
          borderRadius: BorderRadius.circular(1000),
          boxShadow: widget.currentIndex == widget.index
              ? [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 3,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 3,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    blurRadius: 14,
                    spreadRadius: 3,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 1),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.currentIndex == widget.index
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Icon(
              widget.item.icon.icon,
              size: widget.currentIndex == widget.index ? 28 : 24,
              color:
                  widget.currentIndex == widget.index ? widget.activeColor : widget.inActiveColor,
            ),
            widget.currentIndex == widget.index
                ? Container()
                : Flexible(
                    child: Text(
                      // tên button bottom Navigation bar
                      widget.item.title,
                      style: TextStyle(
                          color: widget.inActiveColor, fontWeight: FontWeight.bold, fontSize: 12),

                      textAlign: TextAlign.center,
                    ),
                  )
          ],
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 2.0),
          child: AnimatedAlign(
            curve: Curves.easeOutCirc,
            duration: Duration(milliseconds: 300),
            alignment:
                widget.currentIndex == widget.index ? Alignment.topCenter : Alignment.bottomCenter,
            child: AnimatedContainer(
                //padding: EdgeInsets.all(15.0),
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 000),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000.0),
                  ),
                  color: widget.currentIndex == widget.index
                      ? widget.itemBackgroudnColor
                      : widget.backgroundColor,
                ),
                child: icon),
          ),
        ),
        AnimatedOpacity(
          opacity: widget.currentIndex == widget.index ? 1.0 : 0.0,
          duration: Duration(milliseconds: 0),
          curve: Curves.easeInOut,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: widget.currentIndex == widget.index
                  ? Container()
                  : Text(
                      widget.item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void selectItem() {
    widget.onChanged(widget.index);
  }
}
