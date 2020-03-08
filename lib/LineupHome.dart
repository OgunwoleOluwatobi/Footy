import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class LineupHome extends StatelessWidget {

  final formhome;
  final List datallone;
  final PaletteGenerator paletteOne;

  LineupHome({this.formhome, this.datallone, this.paletteOne});

  

  @override
  Widget build(BuildContext context) {
    var color = paletteOne.lightVibrantColor != null ? paletteOne.lightVibrantColor.color : paletteOne.darkMutedColor != null ? paletteOne.darkMutedColor.color : Colors.black;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 700,
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 60,
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
                        color: color,
                      ),
                      child: Center(
                        child: Text(datallone[0]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      child: Text(datallone[0]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
    formhome.length == 5 ? 
      formhome[0] == '5' ? Positioned(
        top: 130,
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
                        color: color,
                      ),
                      child: Center(
                        child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'], textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
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
                        color: color,
                      ),
                      child: Center(
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: color,
                      ),
                      child: Center(
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' ? 
          Positioned(
        top: 130,
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
                            child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : Positioned(
        top: 130,
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
                            child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
      : formhome.length == 4 ? 
      formhome[0] == '5' ? Positioned(
        top: 130,
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
                        child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' ? 
          Positioned(
        top: 130,
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
                            child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : Positioned(
        top: 130,
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
            : formhome[0] == '5' ? Positioned(
        top: 155,
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                        child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' ? 
          Positioned(
        top: 155,
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : Positioned(
        top: 155,
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[1]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[1]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[2]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[2]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        color: paletteOne.darkMutedColor == null ? Colors.black : paletteOne.darkMutedColor.color,
                      ),
                      child: Center(
                            child: Text(datallone[3]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[3]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )),

      







      formhome.length == 5 ? 
      formhome[1] == '5' && formhome[0] == '3' ? 
      Positioned(
        top: 205,
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
                        child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[1] == '5' && formhome[0] == '4' ? 
      Positioned(
        top: 205,
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
                        child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) 
      : formhome[1] == '4' && formhome[0]=='3' ? 
          Positioned(
        top: 205,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : formhome[1] == '4' && formhome[0]=='4' ? 
          Positioned(
        top: 205,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : formhome[1] == '4' && formhome[0]=='5' ? 
          Positioned(
        top: 205,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          )
          : formhome[1] == '3' && formhome[0] == '3' ? Positioned(
        top: 205,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '3' && formhome[0] == '4' ? Positioned(
        top: 205,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '3' && formhome[0] == '5' ? Positioned(
        top: 205,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) 
          : formhome[1] == '2' && formhome[0] == '3' ? Positioned(
        top: 205,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '2' && formhome[0] == '4' ? Positioned(
        top: 205,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '2' && formhome[0] == '5' ? Positioned(
        top: 205,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
          : formhome[1] == '1' && formhome[0] == '3' ? Positioned(
        top: 205,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '1' && formhome[0] == '4' ? Positioned(
        top: 205,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
          : Positioned(
        top: 205,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
      : formhome.length == 4 ? 
        formhome[1] == '5' && formhome[0] == '3' ? 
      Positioned(
        top: 220,
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
                        child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[1] == '5' && formhome[0] == '4' ? 
      Positioned(
        top: 220,
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
                        child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) 
      : formhome[1] == '4' && formhome[0]=='3' ? 
          Positioned(
        top: 220,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : formhome[1] == '4' && formhome[0]=='4' ? 
          Positioned(
        top: 205,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : formhome[1] == '4' && formhome[0]=='5' ? 
          Positioned(
        top: 220,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          )
          : formhome[1] == '3' && formhome[0] == '3' ? Positioned(
        top: 220,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '3' && formhome[0] == '4' ? Positioned(
        top: 220,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '3' && formhome[0] == '5' ? Positioned(
        top: 220,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) 
          : formhome[1] == '2' && formhome[0] == '3' ? Positioned(
        top: 220,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '2' && formhome[0] == '4' ? Positioned(
        top: 220,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '2' && formhome[0] == '5' ? Positioned(
        top: 220,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
          : formhome[1] == '1' && formhome[0] == '3' ? Positioned(
        top: 220,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '1' && formhome[0] == '4' ? Positioned(
        top: 220,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
          : Positioned(
        top: 220,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
            : formhome[1] == '5' && formhome[0] == '3' ? 
      Positioned(
        top: 260,
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
                        child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[4]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[5]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[1] == '5' && formhome[0] == '4' ? 
      Positioned(
        top: 260,
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
                        child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 70,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) 
      : formhome[1] == '4' && formhome[0]=='3' ? 
          Positioned(
        top: 260,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : formhome[1] == '4' && formhome[0]=='4' ? 
          Positioned(
        top: 260,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          ) : formhome[1] == '4' && formhome[0]=='5' ? 
          Positioned(
        top: 260,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
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
                            child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )
          )
          : formhome[1] == '3' && formhome[0] == '3' ? Positioned(
        top: 260,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '3' && formhome[0] == '4' ? Positioned(
        top: 260,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '3' && formhome[0] == '5' ? Positioned(
        top: 260,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) 
          : formhome[1] == '2' && formhome[0] == '3' ? Positioned(
        top: 260,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '2' && formhome[0] == '4' ? Positioned(
        top: 260,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '2' && formhome[0] == '5' ? Positioned(
        top: 260,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                            child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
          : formhome[1] == '1' && formhome[0] == '3' ? Positioned(
        top: 260,
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
                            child: Text(datallone[4]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[4]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )) : formhome[1] == '1' && formhome[0] == '4' ? Positioned(
        top: 260,
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
                            child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ))
          : Positioned(
        top: 260,
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
                            child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                          ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          )),






      formhome.length == 5 ? 
      Positioned(
        top: 275,
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
                        child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) 
      : 
      formhome.length == 4 ?
      formhome[0] == '5' && formhome[1] == '2' && formhome[2] == '2' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '5' && formhome[1] == '2' && formhome[2] == '1' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '4' && formhome[2] == '1' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '3' && formhome[2] == '2' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '3' && formhome[2] == '1' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '2' && formhome[2] == '3' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '2' && formhome[2] == '2' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(flex: 2,),
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '1' && formhome[2] == '4' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '1' && formhome[2] == '3' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '5' && formhome[2] == '1' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '4' && formhome[2] == '2' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '4' && formhome[2] == '1' ?
      Positioned(
        top: 300,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : 
      Positioned(
        top: 300,
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
                        child: Text(datallone[5]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[5]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[6]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[6]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      )
      :
      formhome[0] == '5' && formhome[1] =='4' && formhome[2] == '1' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '5' && formhome[1] =='3' && formhome[2] == '2' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '5' && formhome[1] =='2' && formhome[2] == '3' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) :formhome[0] == '4' && formhome[1] =='5' && formhome[2] == '1' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] =='4' && formhome[2] == '2' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] =='3' && formhome[2] == '3' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] =='2' && formhome[2] == '4' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[7]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[7]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] =='5' && formhome[2] == '2' ?
      Positioned(
        top: 370,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : 
      Positioned(
        top: 370,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ),




      formhome.length == 5 ? 
      Positioned(
        top: 335,
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
                        child: Text(datallone[8]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[8]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) 
      : 
      formhome[0] == '5' && formhome[1] == '2' && formhome[2] == '2' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '5' && formhome[1] == '2' && formhome[2] == '1' && formhome[3] == '2' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '4' && formhome[2] == '1' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '3' && formhome[2] == '2' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '3' && formhome[2] == '1' && formhome[3] == '2' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '2' && formhome[2] == '3' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '2' && formhome[2] == '2' && formhome[3] == '2' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '1' && formhome[2] == '4' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '4' && formhome[1] == '1' && formhome[2] == '3' && formhome[3] == '2' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '5' && formhome[2] == '1' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '4' && formhome[2] == '2' && formhome[3] == '1' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '4' && formhome[2] == '1' && formhome[3] == '2' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : formhome[0] == '3' && formhome[1] == '1' && formhome[2] == '4' && formhome[3] == '2' ?
      Positioned(
        top: 380,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
      ) : SizedBox(height: 0,),




      formhome.length == 5 ? 
      Positioned(
        top: 390,
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
                        child: Text(datallone[9]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[9]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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
                        child: Text(datallone[10]['number'].toString(), textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: 90,
                      child: Text(datallone[10]['player'],style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center),
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