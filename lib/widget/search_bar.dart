import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget bottom;
  final Function(String keyword) onActionPress;

  SearchBar({Key key, this.title, this.bottom, this.onActionPress})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size preferredSize;
}

class _SearchBarState extends State<SearchBar> {
  bool showSearchBar = false;

  Widget titleView() {
    if (showSearchBar == false) {
      return Text(widget.title);
    }
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Colors.grey,
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        hintText: "Tìm kiếm",
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        setState(() {
          showSearchBar = !showSearchBar;
          widget.onActionPress(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleView(),
      actions: [actionView()],
      bottom: widget.bottom,
    );
  }

  Widget actionView() {
    return IconButton(
      icon: Icon(showSearchBar == false ? Icons.search : Icons.close),
      onPressed: () {
        setState(() {
          showSearchBar = !showSearchBar;
        });
      },
    );
  }
}
