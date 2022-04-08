import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:quiz_logic/brain/list_brain.dart';
import 'package:quiz_logic/screens/play_audio.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

import '../utils.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  ListBrain listBrain = ListBrain();

  Uint8List? _imageFile = null;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple App"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: ListView.separated(
                itemCount: listBrain.listOfAction.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(listBrain.listOfAction[index]),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      setState(() {
                        switch (index) {
                          case 0:
                            {
                              _showAchievementDialog(context);
                              //code pop up - in attached pdf
                              // pop up appears and then click on button and share pop on social
                            }
                            break;

                          case 1:
                            {
                              //generate shareable unique link
                              //code a new screen - design in pdf
                              //take to a new screen with details on how to share
                            }
                            break;
                          case 2:
                            {
                              // on tap ability to leave in-app review in app store and google play store
                            }
                            break;
                          case 3:
                            {
                              //on tap to open phone reminder on ios and android to eat breakfast at a time user picks ;
                            }
                            break;
                          case 4:
                            {
                              //statements;
//fix audio
                              // audio to play when app is not displayed.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PlayAudio()));
                            }
                            break;

                          default:
                            {
                              //statements;
                            }
                            break;
                        }
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      thickness: 1,
                    )),
          ),
        ));
  }

  _showAchievementDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      contentPadding:  EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Screenshot(
              controller: screenshotController,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    Text(
                      "SHREDDY",
                      style: TextStyle(
                        color: Colors.blue[100],
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Image.asset(
                        "assets/images/logo.jpg",
                        height: 100,
                        width: 100),
                    const SizedBox(height: 24,),
                    const Text(
                      "MEDAL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "1st SHREDDY Meal\nCooked",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[100],
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          height: 1.1
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text(
                      "1st January 2020",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text(
                      "1 Meal Cooked how delicious! Don't shop now be bold, take whisks!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16,),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
                Utils.showLoader(context);
                _takeScreenShot();
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8)
                ),
                child: const Text(
                  "SHARE YOUR ACHIEVEMENT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Text.rich(
                TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'close',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                    // can add more TextSpans here...
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _takeScreenShot(){
    screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((capturedImage) async {
      _imageFile = capturedImage!;
      _shareImage();
    }).catchError((onError) {
      print(onError);
    });
  }

  _shareImage() async{
    final directory = Platform.isAndroid
        ? (await getExternalStorageDirectory())?.absolute.path//FOR ANDROID
        : (await getApplicationSupportDirectory()).absolute.path;
    File imgFile = File('$directory/screenshot.png');
    if (_imageFile != null) {
      await imgFile.writeAsBytes(_imageFile!);
      print("File Saved on ${imgFile.path}");
      Utils.hideLoader(context);
      await FlutterShare.shareFile(
          title: "Achievement", filePath: imgFile.path);
    }
  }

}
