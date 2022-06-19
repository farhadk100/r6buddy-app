import 'package:flutter/material.dart';
import 'package:r6buddy/utilities/constants.dart';
import 'package:r6buddy/utilities/dio_manager.dart';
import 'package:r6buddy/utilities/enums.dart';
import 'package:dio/dio.dart';

abstract class OnlineProviderBase extends ChangeNotifier{

  LoadStatus _loadStatus = LoadStatus.idle;
  late DioManager dio;
  late Options _options;
  late Response _response;
  late BuildContext _context;

  set response(Response response){
    _response = response;
    notifyListeners();
  }

  set options(Options options){
    _options = options;
    notifyListeners();
  }

  Response get response => _response;

  Options get options => _options;

  LoadStatus get loadStatus => _loadStatus;

  BuildContext get context => _context;

  set loadStatus(LoadStatus value) {
    _loadStatus = value;
    notifyListeners();
  }

  OnlineProviderBase(this._context, this.dio){
    _options = Options(headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-API-Key': Constants.apiKey,
    });
  }

  Future<dynamic> getData();

  refresh(){
    loadStatus = LoadStatus.idle;
    getData();
  }
}