import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  int value = 0;

  @action
  addImage(File file) async {
    String filename = file.path.split('/').last;
    FormData formData = new FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: filename),
    });

    var dio = new Dio();
    var response =
        await dio.post('http://10.0.2.2:3333/car', data: await formData);
    print(response);
  }
}
