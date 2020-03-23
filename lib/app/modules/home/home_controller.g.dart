// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$whichCarAtom = Atom(name: '_HomeBase.whichCar');

  @override
  PredictCar get whichCar {
    _$whichCarAtom.context.enforceReadPolicy(_$whichCarAtom);
    _$whichCarAtom.reportObserved();
    return super.whichCar;
  }

  @override
  set whichCar(PredictCar value) {
    _$whichCarAtom.context.conditionallyRunInAction(() {
      super.whichCar = value;
      _$whichCarAtom.reportChanged();
    }, _$whichCarAtom, name: '${_$whichCarAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_HomeBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$addImageAsyncAction = AsyncAction('addImage');

  @override
  Future addImage(File file) {
    return _$addImageAsyncAction.run(() => super.addImage(file));
  }

  @override
  String toString() {
    final string =
        'whichCar: ${whichCar.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
