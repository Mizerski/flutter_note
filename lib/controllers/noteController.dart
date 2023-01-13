import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  RxList<NoteModel> noteList = RxList<NoteModel>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;

  List<NoteModel> get notes => noteList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user?.uid;
    print("NoteController onit :: $uid");
    noteList.bindStream(Database().noteStream(uid));
    super.onInit();
  }
}
