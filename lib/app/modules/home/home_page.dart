import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Which Car?"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white70,
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 0,
            color: Colors.transparent,
            onPressed: () {
              controller.whichCar = null;
            },
            child: Icon(
              Icons.cached,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.whichCar == null) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                  Colors.red,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Take a picture of the car',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                controller.loading
                    ? MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: null,
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white70,
                          ),
                        ),
                      )
                    : MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.photo_camera,
                          color: Colors.white70,
                          size: 36,
                        ),
                        onPressed: () async {
                          var image = await ImagePicker.pickImage(
                              source: ImageSource.camera);
                          if (image != null) {
                            controller.addImage(image.absolute);
                          }
                        },
                      ),
              ],
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                  Colors.red,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 2,
                    color: Colors.white70,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Confidence: ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.whichCar.confidence}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Text(
                        'Body style: ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.whichCar.bodyStyle}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Text(
                        'Make: ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.whichCar.make}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Text(
                        'Model: ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.whichCar.model}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Text(
                        'Model Year: ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${controller.whichCar.modelYear}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          controller.whichCar = null;
                        },
                        child: Icon(Icons.check),
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          controller.whichCar = null;
                        },
                        child: Icon(Icons.close),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
