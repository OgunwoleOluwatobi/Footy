import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class LineupAway extends StatelessWidget {

  final formaway;
  final List datalltwo;
  final PaletteGenerator palette;

  LineupAway({this.formaway, this.datalltwo, this.palette,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 900,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 790,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: new Border(
                            right: new BorderSide(width: 2.0, color: Colors.white),
                            left: new BorderSide(width: 2.0, color: Colors.white),
                            top: new BorderSide(width: 2.0, color: Colors.white),
                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(datalltwo[0]['number'].toString(), textAlign: TextAlign.center,),
                        ),
                      ),
                      Container(
                        child: Text(datalltwo[0]['player']),
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

          formaway.length == 5 ? 
                            formaway[0] == '5' ? Positioned(
                              top: 720,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' ? 
                                Positioned(
                              top: 720,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : Positioned(
                              top: 720,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                            : formaway.length == 4 ? 
                            formaway[0] == '5' ? Positioned(
                              top: 720,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' ? 
                                Positioned(
                              top: 720,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: palette.darkVibrantColor.color,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : Positioned(
                              top: 720,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: palette.dominantColor.color,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                 : formaway[0] == '5' ? Positioned(
                              top: 695,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' ? 
                                Positioned(
                              top: 695,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : Positioned(
                              top: 695,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[1]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[1]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[2]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[2]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[3]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[3]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )),


                            formaway.length == 5 ? 
                            formaway[1] == '5' && formaway[0] == '3' ? 
                            Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[1] == '5' && formaway[0] == '4' ? 
                            Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) 
                            : formaway[1] == '4' && formaway[0]=='3' ? 
                                Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : formaway[1] == '4' && formaway[0]=='4' ? 
                                Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : formaway[1] == '4' && formaway[0]=='5' ? 
                                Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                )
                                : formaway[1] == '3' && formaway[0] == '3' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '3' && formaway[0] == '4' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '3' && formaway[0] == '5' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) 
                                : formaway[1] == '2' && formaway[0] == '3' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '2' && formaway[0] == '4' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '2' && formaway[0] == '5' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                : formaway[1] == '1' && formaway[0] == '3' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '1' && formaway[0] == '4' ? Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                : Positioned(
                              top: 645,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                              : formaway.length == 4 ?
                                formaway[1] == '5' && formaway[0] == '3' ? 
                            Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[1] == '5' && formaway[0] == '4' ? 
                            Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) 
                            : formaway[1] == '4' && formaway[0]=='3' ? 
                                Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : formaway[1] == '4' && formaway[0]=='4' ? 
                                Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : formaway[1] == '4' && formaway[0]=='5' ? 
                                Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                )
                                : formaway[1] == '3' && formaway[0] == '3' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '3' && formaway[0] == '4' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '3' && formaway[0] == '5' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) 
                                : formaway[1] == '2' && formaway[0] == '3' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '2' && formaway[0] == '4' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '2' && formaway[0] == '5' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                : formaway[1] == '1' && formaway[0] == '3' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '1' && formaway[0] == '4' ? Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                : Positioned(
                              top: 630,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                              : 
                              formaway[1] == '5' && formaway[0] == '3' ? 
                            Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[1] == '5' && formaway[0] == '4' ? 
                            Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) 
                            : formaway[1] == '4' && formaway[0]=='3' ? 
                                Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : formaway[1] == '4' && formaway[0]=='4' ? 
                                Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                ) : formaway[1] == '4' && formaway[0]=='5' ? 
                                Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center,),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                                )
                                : formaway[1] == '3' && formaway[0] == '3' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '3' && formaway[0] == '4' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '3' && formaway[0] == '5' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) 
                                : formaway[1] == '2' && formaway[0] == '3' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '2' && formaway[0] == '4' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '2' && formaway[0] == '5' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                : formaway[1] == '1' && formaway[0] == '3' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[4]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[4]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )) : formaway[1] == '1' && formaway[0] == '4' ? Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ))
                                : Positioned(
                              top: 590,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                                  child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                                ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )),




                            formaway.length == 5 ? 
                            Positioned(
                              top: 585,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) 
                            : 
                            formaway.length == 4 ?
                            formaway[0] == '5' && formaway[1] == '2' && formaway[2] == '2' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '5' && formaway[1] == '2' && formaway[2] == '1' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '4' && formaway[2] == '1' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '3' && formaway[2] == '2' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '3' && formaway[2] == '1' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '2' && formaway[2] == '3' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '2' && formaway[2] == '2' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '1' && formaway[2] == '4' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '1' && formaway[2] == '3' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '5' && formaway[2] == '1' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '4' && formaway[2] == '2' ?
                            Positioned(
                              top: 540,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '4' && formaway[2] == '1' ?
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : 
                            Positioned(
                              top: 550,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[5]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[5]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[6]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[6]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            )
                            :
                            formaway[0] == '5' && formaway[1] =='4' && formaway[2] == '1' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '5' && formaway[1] =='3' && formaway[2] == '2' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '5' && formaway[1] =='2' && formaway[2] == '3' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) :formaway[0] == '4' && formaway[1] =='5' && formaway[2] == '1' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] =='4' && formaway[2] == '2' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] =='3' && formaway[2] == '3' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] =='2' && formaway[2] == '4' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[7]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[7]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] =='5' && formaway[2] == '2' ?
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : 
                            Positioned(
                              top: 490,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ),




                            formaway.length == 5 ? 
                            Positioned(
                              top: 515,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[8]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[8]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) 
                            : 
                            formaway[0] == '5' && formaway[1] == '2' && formaway[2] == '2' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '5' && formaway[1] == '2' && formaway[2] == '1' && formaway[3] == '2' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '4' && formaway[2] == '1' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '3' && formaway[2] == '2' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '3' && formaway[2] == '1' && formaway[3] == '2' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '2' && formaway[2] == '3' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '2' && formaway[2] == '2' && formaway[3] == '2' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '1' && formaway[2] == '4' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '4' && formaway[1] == '1' && formaway[2] == '3' && formaway[3] == '2' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '5' && formaway[2] == '1' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '4' && formaway[2] == '2' && formaway[3] == '1' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '4' && formaway[2] == '1' && formaway[3] == '2' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : formaway[0] == '3' && formaway[1] == '1' && formaway[2] == '4' && formaway[3] == '2' ?
                            Positioned(
                              top: 470,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : SizedBox(height: 0),




                            formaway.length == 5 ? 
                            Positioned(
                              top: 460,
                              child: Container(
                                  //margin: EdgeInsets.only(right: 50),
                                  /*decoration: BoxDecoration(
                                          border: new Border(
                                            right: new BorderSide(width: 2.0, color: Colors.white),
                                            left: new BorderSide(width: 2.0, color: Colors.white),
                                            top: new BorderSide(width: 2.0, color: Colors.white),
                                            bottom: new BorderSide(width: 2.0, color: Colors.white),
                                          ),),*/
                                  width: MediaQuery.of(context).size.width,//408,
                                  child: Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[9]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[9]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: new Border(
                                                right: new BorderSide(width: 2.0, color: Colors.white),
                                                left: new BorderSide(width: 2.0, color: Colors.white),
                                                top: new BorderSide(width: 2.0, color: Colors.white),
                                                bottom: new BorderSide(width: 2.0, color: Colors.white),
                                              ),
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(datalltwo[10]['number'].toString(), textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            child: Text(datalltwo[10]['player'], textAlign: TextAlign.center),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                            ) : SizedBox(height: 0,),
        ],
      ),
    );
  }
}