import 'package:flutter/material.dart';

class ZekrWidget extends StatefulWidget {
  int index = 2;
  String? zekr;

  var widge;

  ZekrWidget(this.index, this.zekr, {this.widge});

  @override
  State<ZekrWidget> createState() => _ZekrWidgetState();
}

class _ZekrWidgetState extends State<ZekrWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.widge == null)
      widget.widge = Container(
        width: 0,
        height: 0,
      );
    return InkWell(
      onTap: () {
        if (widget.index > 0) {
          widget.index--;
        }
        ;
        setState(() {});
      },
      child: Container(
        child: Card(
          color: Theme.of(context).backgroundColor,
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${widget.index}',
                style: Theme.of(context).textTheme.headline4,
              ),
              widget.index != 0
                  ? Card(
                      elevation: 10,
                      color: Theme.of(context).backgroundColor,
                      child: Column(
                        children: [
                          widget.widge,
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Flex(direction: Axis.vertical, children: [
                              Wrap(children: [
                                Text(
                                  widget.zekr!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(height: 1.8),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ]),
                          ),
                        ],
                      ),
                    )
                  : Card(
                      color: Color.fromRGBO(126, 58, 58, 1.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Flex(direction: Axis.vertical, children: [
                          Wrap(children: [
                            Text(
                              widget.zekr!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(height: 1.8),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ]),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
