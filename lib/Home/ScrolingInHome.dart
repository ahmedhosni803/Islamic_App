import 'package:flutter/material.dart';

class ScrolingInHome extends StatefulWidget {
  String text;
  Size size;
  String page;
  String? image = 'sallah.png';

  ScrolingInHome(this.text, this.size, this.page, {this.image});

  @override
  State<ScrolingInHome> createState() => _ScrolingInHomeState();
}

class _ScrolingInHomeState extends State<ScrolingInHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, widget.page);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Theme.of(context).primaryColor),
              color: Theme.of(context).backgroundColor),
          width: MediaQuery.of(context).size.width * 0.45,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/icon/${widget.image}'),
                  width: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.text,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: widget.size.width * 0.04),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
