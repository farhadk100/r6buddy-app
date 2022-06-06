import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/maps/operator_map.dart';
import 'package:r6buddy/providers/online_provider_base.dart';
import 'package:r6buddy/utilities/constants.dart';
import 'package:r6buddy/utilities/dio_manager.dart';
import 'package:r6buddy/utilities/connection_state.dart';

class OperatorsProvider extends OnlineProviderBase {

  late List<Operator> operators = [];

  OperatorsProvider(DioManager dio) : super(dio){
    getOperators();
  }


  Future<dynamic> getOperators() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    response = await dio.getRequest(Constants.operatorsApi, {}, options);
    print('damn');
    if (response.statusCode == HttpStatus.ok){
      operators = response.data['_items'].map((operator) => Operator.fromJson(operator)).toList().cast<Operator>();
      loadStatus = LoadStatus.loaded;
    } else {
      loadStatus = LoadStatus.error;
    }
    return response;
  }

  refresh(){
    loadStatus = LoadStatus.idle;
    getOperators();
  }


}