import 'package:flutter/material.dart';
import 'package:quiz_logic/brain/list_brain.dart';
import 'package:quiz_logic/screens/play_audio.dart';



class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {


ListBrain listBrain = ListBrain();


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
              itemBuilder:   (BuildContext context, int index) {
                return ListTile(
                  title: Text(listBrain.listOfAction[index]),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    setState(() {

                      switch(index) {
                        case 0: {
                          //code pop up - in attached pdf
                          // pop up appears and then click on button and share pop on social
                        }
                        break;

                        case 1: {
                          //generate shareable unique link
                          //code a new screen - design in pdf
                          //take to a new screen with details on how to share
                        }
                        break;
                        case 2: {
                          // on tap ability to leave in-app review in app store and google play store
                        }
                        break;
                        case 3: {
                          //on tap to open phone reminder on ios and android to eat breakfast at a time user picks ;
                        }
                        break;
                        case 4: {
                          //statements;
//fix audio
                        // audio to play when app is not displayed.
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const PlayAudio()));

                        }
                        break;

                        default: {
                          //statements;
                        }
                        break;
                      }

                    });
                  },
                );
              } ,
               separatorBuilder:    (BuildContext context, int index) => const Divider( thickness: 1,)
        ),
      ),
    ));
  }
}



