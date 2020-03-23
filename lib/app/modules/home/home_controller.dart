import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:whichcar/app/model/PredictCar.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final dio = new Dio();

  @observable
  PredictCar whichCar;

  @observable
  bool loading = false;

  @action
  addImage(File file) async {
    loading = true;
    print(whichCar);
    String filename = file.path.split('/').last;
    FormData formData = new FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: filename),
    });

    Response response = await dio
        .post('https://which-car-backend.herokuapp.com/car', data: formData);

    whichCar = PredictCar.fromJson(response.data);
    print(response.data);
    // whichCar = response.data;
    print(whichCar);
    loading = false;
  }
}
