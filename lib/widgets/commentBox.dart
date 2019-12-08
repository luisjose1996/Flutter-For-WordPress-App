import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

Widget commentBox(String author, String avatar, String content) {
  return Card(
    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
    child: ListTile(
      dense: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatar),
      ),
      title: Html(
          data: content,
          customTextStyle: (dom.Node node, TextStyle baseStyle) {
            if (node is dom.Element) {
              switch (node.localName) {
                case "p":
                  return baseStyle.merge(TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.5,
                      fontFamily: "Nunito"));
              }
            }
            return baseStyle;
          }),
      subtitle: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        padding: EdgeInsets.fromLTRB(4, 8, 0, 8),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Text(
          author,
          style: TextStyle(fontSize: 12),
        ),
      ),
    ),
  );
}
