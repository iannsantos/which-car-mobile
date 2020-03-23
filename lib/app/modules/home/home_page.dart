import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          MaterialButton(
            color: Colors.transparent,
            onPressed: () {
              controller.whichCar = null;
            },
            child: Icon(Icons.cached),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.whichCar == null) {
          return Column(
            children: <Widget>[
              Text('Tire uma foto do carro'),
              controller.loading
                  ? RaisedButton(
                      onPressed: null,
                      child: Icon(
                        Icons.cached,
                      ),
                    )
                  : RaisedButton(
                      child: Icon(Icons.photo_camera),
                      onPressed: () async {
                        var image = await ImagePicker.pickImage(
                            source: ImageSource.camera);
                        controller.addImage(image.absolute);
                      },
                    ),
            ],
          );
        } else {
          return Column(
            children: <Widget>[
              Text('Body style: ${controller.whichCar.bodyStyle}'),
              Text('Confidence: ${controller.whichCar.confidence}'),
              Text('Make: ${controller.whichCar.make}'),
              Text('Model: ${controller.whichCar.model}'),
              Text('Model Year: ${controller.whichCar.modelYear}'),
            ],
          );
        }
      }),
    );
  }
}
