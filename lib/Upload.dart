import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footyappp/Home.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


class Upload extends StatefulWidget {
  const Upload({Key key}) : super(key: key);
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  File sampleImage;
  String _myValue;
  String _titleValue;
  String url;
  int count = 0;
  double opa = 0.0;
  bool _visi = false;
  bool title = false;
  bool desc = false;
  List datat = [];
  int dataLength = 0;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() { 
    super.initState();
    DatabaseReference postRef = FirebaseDatabase.instance.reference().child("Posts");
    postRef.orderByChild("Timestamp").onChildAdded.listen((Event event) {
      Map<dynamic, dynamic> data = event.snapshot.value;
      datat.add(data['index']);
    });
    dataLength = datat.length;
  }

  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
      enableUpload();
    });
  }

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    } else {
      return false;
    } 
  }

  void uploadStatusImage() async {
    if(validateAndSave()){
      setState(() {
      _visi=true;
      opa =0.5;
    });
      final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");
      var timeKey = new DateTime.now();
      final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = imageUrl.toString();
      print("Image Url =" + url);

      goToHomePage();

      saveToDatabase(url);
    }else{
      print("error");
    }
  }

  void saveToDatabase(url){
    var dbTimeKey = new DateTime.now();
    var formatDate = new DateFormat('MMM d, yyyy');
    var formatTime = new DateFormat('EEEE, hh:mm aaa');
    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference  ref = FirebaseDatabase.instance.reference().child("Posts");
    int ting = new DateTime.now().millisecondsSinceEpoch;
    int timm = -1 * ting;
    print(timm);
    var data = {
      "image": url,
      "title": _titleValue,
      "description": _myValue,
      "date": date,
      "time": time,
      "Timestamp": timm,
      "index": -1*(dataLength + 1)
    };
    ref.push().set(data);
  }

  void goToHomePage(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
    { return new Home();}
    ));
  }

  @override
  Widget build(BuildContext context) {

      Widget title = new Container(
        margin: EdgeInsets.only(left: 0, top: 8, bottom: 0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*Image.asset(
              'assets/images/logo.png',
              height: 92.0,
              width: 62.0,
              //alignment: Alignment(13, 8),
              
              ),*/
              Container(

                margin: EdgeInsets.only(left: 15, top: 10, bottom: 0),
                child: Align(
                  //alignment: Alignment(84, 51),
                  child: Text(
                    "FOOTY",
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 39.0, fontFamily: 'RobotoBlack')
                  ),
                ),
              ),
          ],
        ),
      );

      final topAppBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
      title: title,
      leading: Image.asset('assets/images/logo.png',
              height: 92.0,
              width: 62.0, alignment: Alignment(7, 8)),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07),
        child: topAppBar,
      ),
      body: new Container(
        child: Stack(
          children: <Widget>[
            sampleImage == null ? Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height*0.5, child: Padding(
              padding: EdgeInsets.only(top: 350.0, left: 50.0, right: 20.0),
              child: Text("Select an Image to Continue", style:  TextStyle(fontSize: 30, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontFamily: 'Roboto'),))) : enableUpload(),
              Visibility(
                visible: _visi,
                child: Opacity(
                opacity: opa,
                child: Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),),)
              ),)
          ],
        )
        
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Select Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload(){
    return Container(
      //width: double.infinity,
      //height: double.infinity,
      child: ListView(
        children: <Widget>[
          new Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(sampleImage,height: 420, width: MediaQuery.of(context).size.width,),
            SizedBox(height: 15.0,),
            //Expanded(
              //flex: 1,
              //child: 
              TextFormField(
              decoration: new InputDecoration(labelText: 'Title', fillColor: Colors.black, focusColor: Colors.black,labelStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 20)),
              maxLines: null,
              validator: (value){
                return value.isEmpty ? 'Title is needed' : null;// ? title = true : title = false;
              },
              onSaved: (value){
                return _titleValue = value;
              },
            ),//),
            //Expanded(
              //flex: 1,
              //child: 
              new TextFormField(
              decoration: new InputDecoration(labelText: 'Description', labelStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 20)),
              maxLines: null,
              validator: (value){
                return value.isEmpty ? 'Desciption is needed' : null;// ? desc = true : desc = false;
              },
              onSaved: (value){
                return _myValue = value;
              },
            ),//),
            SizedBox(height: 15.0,),
            //Expanded(
                          //child: 
                RaisedButton(
                elevation: 10.0,
                child: Text("Post"),
                textColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? new Color(0xffF7931D) : new Color(0xffF7931D),

                onPressed: uploadStatusImage ,
              ),
            //)
          ],
        ),
      ),
        ],
      ),
    );
  }
}