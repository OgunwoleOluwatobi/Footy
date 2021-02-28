import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footyappp/Home.dart';
import 'package:footyappp/views/widgets/utility_widgets.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


class Upload extends StatefulWidget {
  const Upload({Key key}) : super(key: key);
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  ImagePicker imagePicker = ImagePicker();
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
    PickedFile tempImage = await imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 5,
    );
    setState(() {
      sampleImage = File(tempImage.path);
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

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: topAppBar(context),
      body: Container(
        child: Stack(
          children: <Widget>[
            sampleImage == null ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Select an Image to Continue",
                    style:  TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                      fontFamily: 'Roboto'),),
                )),
            ) : enableUpload(),
              Visibility(
                visible: _visi,
                child: Opacity(
                opacity: opa,
                child: Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),),)
              ),)
          ],
        )
        
      ),
      floatingActionButton: sampleImage != null ? null : FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Select Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload(){
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.file(
                      sampleImage,
                      height: 300.h,
                      width: double.infinity,
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: 'Title',
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black
                            ),
                          ),
                          labelStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 20)
                        ),
                        maxLines: null,
                        validator: (value){
                          return value.isEmpty ? 'Title is needed' : null;// ? title = true : title = false;
                        },
                        onSaved: (value){
                          return _titleValue = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black
                            ),
                          ),
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 20)
                        ),
                        maxLines: null,
                        validator: (value){
                          return value.isEmpty ? 'Desciption is needed' : null;// ? desc = true : desc = false;
                        },
                        onSaved: (value){
                          return _myValue = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Post'
                    )
                  )
                ),
                textColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? new Color(0xffF7931D) : new Color(0xffF7931D),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  uploadStatusImage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}