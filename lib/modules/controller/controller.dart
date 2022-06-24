import 'dart:developer';

import 'package:firedata_app/model/user_data_model.dart';
import 'package:firedata_app/modules/firestorerepository/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Firestore firestoreRepository = Firestore();
  RxBool isLoader = false.obs;
  RxList<UserDataModel> historyDataList = <UserDataModel>[].obs;

  @override
  onInit() {
    fetchAllData();
    super.onInit();
  }


  fetchAllData() async {
    try {
      isLoader.value = true;
      historyDataList.value = await firestoreRepository.getData();
    isLoader.value = false;
    } catch (error) {
      isLoader.value = false;
      print("Error ${error.toString()}");
    }
  }




  //
  // Future<void> setHistoryData() async {
  //   String docId = ListData.doc().id;
  //   await ListData.doc(docId).set({
  //     'title': titleController.text,
  //     'url': linkController.text,
  //     'time': DateTime.now(),
  //   });
  // }
  //
  //
  // Future<void> allData() async {
  //   try {
  //     isLoader.value = true;
  //     historyDataList.value = await firestoreRepository.getData();
  //     isLoader.value = false;
  //   } catch (error) {
  //     isLoader.value = false;
  //     log("Error ${error.toString()}");
  //   }
  // }





}

