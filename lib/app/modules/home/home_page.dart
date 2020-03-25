import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whichcar/app/modules/home/components/row_information_widget.dart';
import 'package:whichcar/app/modules/home/components/styled_container_widget.dart';

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
          return StyledContainerWidget(
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
          ));
        } else {
          return StyledContainerWidget(
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
                  RowInformationWidget(
                    label: 'Confidence',
                    text: controller.whichCar.confidence,
                  ),
                  SizedBox(height: 8),
                  RowInformationWidget(
                    label: 'Body style',
                    text: controller.whichCar.bodyStyle,
                  ),
                  SizedBox(height: 8),
                  RowInformationWidget(
                    label: 'Make',
                    text: controller.whichCar.make,
                  ),
                  SizedBox(height: 8),
                  RowInformationWidget(
                    label: 'Model',
                    text: controller.whichCar.model,
                  ),
                  SizedBox(height: 8),
                  RowInformationWidget(
                    label: 'Model Year',
                    text: controller.whichCar.modelYear,
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
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
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
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
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
