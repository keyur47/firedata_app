import 'dart:io';

import 'package:firedata_app/modules/controller/controller.dart';
import 'package:firedata_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Controller controller = Get.put(Controller());

  // Firestore repository = Firestore();
  // List<UserDataModel> historyDataList = [];
  // bool loadingData = true;
  //
  // @override
  // void initState() {
  //   fetchAllData();
  //   // TODO: implement initState
  //   super.initState();
  // }
  //
  // fetchAllData() async {
  //   try {
  //     historyDataList = await repository.getData();
  //     loadingData = false;
  //     if (mounted) {
  //       setState(() {
  //         log("message ---- > ${historyDataList.first}");
  //       });
  //     }
  //   } catch (error) {
  //     print("Error ${error.toString()}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title!"),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => controller.isLoader.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.historyDataList.length,
                      itemBuilder: (context, index) {
                        return SwipeActionCell(
                          key: ObjectKey(controller.historyDataList[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2),
                                color: AppColor.greyColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey[400],
                                      backgroundImage: FileImage(
                                        File("${controller.historyDataList[index].image}"),
                                      ),
                                      radius: 19,
                                    ),
                                    Container(
                                      width: 20,
                                      child: Image.asset("${controller.historyDataList[index].image}")),
                                    Container(
                                      width: 20,
                                      child: Image.file(File("${controller.historyDataList[index].image}"))),
                                    Container(
                                      width: 20,
                                      child: Image.network("${controller.historyDataList[index].image}")),
                                    Text(
                                        "${controller.historyDataList[index].image}",style: const TextStyle(fontSize: 25),),
                                    Text(
                                      controller.historyDataList[index].title
                                              ?.toUpperCase() ??
                                          '',
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      controller.historyDataList[index].url ??
                                          'aa',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.lightBlue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    Text(
                                      dateTimeformat(controller
                                          .historyDataList[index].time!
                                          .toDate()),
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.red),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  dateTimeformat(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    final String formatted = formatter.format(date);
    return formatted;
  }
}

// import 'package:demo_firebase_project/utils/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'add_data.dart';
// import 'list_data.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.darkBlue,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//              Text("All Details",style: TextStyle(color: Colors.white),),
//             // GestureDetector(
//             //   child: const Icon(
//             //     Icons.add,
//             //     size: 30,
//             //
//             //   ),
//             //   onTap: () {
//             //     Get.to(const AddStudent());
//             //   },
//             // )
//           ],
//         ),
//       ),
//       body: ListStudent(),
//       floatingActionButton: FloatingActionButton(
//         splashColor: Colors.transparent,
//         backgroundColor: AppColors.darkBlue,
//         child: Icon(Icons.add,size: 30,),
//         onPressed: () {
//           Get.to(const AddStudent());
//         },
//       ),
//     );
//   }
// }
//
//
//

///dfsdfsdfsdfsd

// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
//
// class ImageUploads extends StatefulWidget {
//   const ImageUploads({Key? key}) : super(key: key);
//
//   @override
//   _ImageUploadsState createState() => _ImageUploadsState();
// }
//
// class _ImageUploadsState extends State<ImageUploads> {
//
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//
//   File? _photo;
//   final ImagePicker _picker = ImagePicker();
//
//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//
//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'files/$fileName';
//
//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('file/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print('error occured');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           const SizedBox(
//             height: 32,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 _showPicker(context);
//               },
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.black,
//                 child: _photo != null
//                        ? ClipRRect( borderRadius: BorderRadius.circular(50),
//                           child: Image.file(_photo!,width: 100,height: 100,fit: BoxFit.fitHeight),)
//                     : Container(decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(50)),
//                      width: 100,
//                      height: 100,
//                      child: Icon(Icons.camera_alt,color: Colors.grey[800],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                     leading: Icon(Icons.photo_library),
//                     title: Text('Gallery'),
//                     onTap: () {
//                       imgFromGallery();
//                       Navigator.of(context).pop();
//                     }),
//               ],
//             ),
//           );
//         });
//   }
// }
