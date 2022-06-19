import 'dart:io';

import 'package:flutter/material.dart';
import 'package:r6buddy/maps/gadget_map.dart';
import 'package:r6buddy/maps/weapon_map.dart';
import 'package:r6buddy/providers/online_provider_base.dart';
import 'package:r6buddy/utilities/constants.dart';
import 'package:r6buddy/utilities/dio_manager.dart';
import 'package:r6buddy/utilities/enums.dart';

class WeaponsProvider extends OnlineProviderBase {
  List<Weapon> _weapons = [];

  WeaponsProvider(BuildContext context, DioManager dio) : super(context,dio){
    getData();
  }

  get weapons => _weapons;

  @override
  Future<dynamic> getData() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    response = await dio.getRequest(Constants.weaponsApi, {}, options);
    if (response.statusCode == HttpStatus.ok){
      _weapons = response.data.map((weapon) => Weapon.fromJson(weapon)).toList().cast<Weapon>();
      loadStatus = LoadStatus.loaded;
    } else {
      loadStatus = LoadStatus.error;
    }
    return response;
  }
}