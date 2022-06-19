import 'dart:io';

import 'package:flutter/material.dart';
import 'package:r6buddy/maps/gadget_map.dart';
import 'package:r6buddy/maps/operator_map.dart';
import 'package:r6buddy/providers/online_provider_base.dart';
import 'package:r6buddy/utilities/constants.dart';
import 'package:r6buddy/utilities/dio_manager.dart';
import 'package:r6buddy/utilities/enums.dart';

class GadgetsProvider extends OnlineProviderBase{
  List<Gadget> _gadgets = [];

  GadgetsProvider(BuildContext context, DioManager dio) : super(context,dio){
    getData();
  }

  get gadgets => _gadgets;

  @override
  Future<dynamic> getData() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    response = await dio.getRequest(Constants.gadgetsApi, {}, options);
    if (response.statusCode == HttpStatus.ok){
      _gadgets = response.data.map((gadget) => Gadget.fromJson(gadget)).toList().cast<Gadget>();
      loadStatus = LoadStatus.loaded;
    } else {
      loadStatus = LoadStatus.error;
    }
    return response;
  }

}