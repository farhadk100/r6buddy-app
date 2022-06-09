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
  bool _showAttackers = true;

  OperatorsProvider(BuildContext context, DioManager dio) : super(context,dio){
    getOperators();
  }

  bool get showAttackers => _showAttackers;

  set showAttackers(bool value) {
    _showAttackers = value;
    notifyListeners();
  }


  Future<dynamic> getOperators() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    response = await dio.getRequest(Constants.operatorsApi, {}, options);
    if (response.statusCode == HttpStatus.ok){
      operators = response.data.map((operator) => Operator.fromJson(operator)).toList().cast<Operator>();
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