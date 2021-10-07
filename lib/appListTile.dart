import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  void Function() ontap;
  Color colorText;
  String text;
  Color colorListTile;
  String TitleText;
  int index;
  ImageProvider image;
  AppListTile(
      {Key? key,
      required this.ontap,
      required this.colorText,
      required this.text,
      required this.colorListTile,
      required this.TitleText,
      required this.index,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight * .09,
        child: ListTile(
            onTap: ontap,
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: colorText,
                )),
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                text,
                maxLines: 1,
                style: TextStyle(color: colorText, fontSize: 11),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            tileColor: colorListTile,
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                TitleText,
                maxLines: 1,
                style: TextStyle(color: colorText, fontSize: 14),
              ),
            ),
            leading: Stack(children: [
              Container(
                height: screenHeight * .099,
                width: screenWidth * .17,
                padding: EdgeInsets.only(
                  right: screenWidth * .01,
                  left: screenWidth * .01,
                  top: screenWidth * .0076,
                  bottom: screenWidth * .0076,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image(fit: BoxFit.cover, image: image)),
              ),
              Positioned(
                  right: screenWidth * .01,
                  top: screenWidth * .0076,
                  child: Container(
                    height: screenHeight * .024,
                    width: screenWidth * .05,
                    decoration: BoxDecoration(
                        color: colorListTile,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                    child: Center(
                      child: Text(
                        (index + 1).toString().length == 1
                            ? "0" + (index + 1).toString()
                            : (index + 1).toString(),
                        style: TextStyle(color: colorText, fontSize: 8),
                        maxLines: 1,
                      ),
                    ),
                  ))
            ])));
  }
}
