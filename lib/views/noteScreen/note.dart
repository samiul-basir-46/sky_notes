import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/controller/notes_controller.dart';
import 'package:notepad/models/notes_model.dart';
import 'package:notepad/utils/colors.dart';
import 'package:get/get.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {'isUpdate': false, 'note': null};

    final bool isUpdate = arg['isUpdate'] ?? false;
    final note = arg['note'] == null
        ? null
        : arg['note'] as QueryDocumentSnapshot<Map<String, dynamic>>;
    // final int? index = arg['index'] == null ? null : arg['index'] as int;

    DateTime createdDate = arg['note'] == null
        ? DateTime.now()
        : (note!['created_date'] as Timestamp).toDate();

    final titleController = TextEditingController(
      text: isUpdate ? note!['title'] : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note!['description'] : null,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // AlignWidget(),
            const SizedBox(height: 15),
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.black38),
              ),
            ),
            const SizedBox(height: 10),
            Divider(height: 2, color: AppColor.greyColor,thickness: 2,),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                maxLines: 50,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Describe about your notes',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            if (titleController.text.isEmpty ||
                descriptionController.text.isEmpty) {
              Get.snackbar('Error', 'Title and Description is required');
            } else {
              isUpdate
                  ? controller.updateNote(
                      note!.id,
                      NotesModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdDate: createdDate,
                        updatedTime: DateTime.now(),
                      ),
                    )
                  : controller.addNotes(
                      NotesModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdDate: DateTime.now(),
                      ),
                    );
              Get.back();
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor,
            ),
            child: Center(
              child: Text(
                'Save Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ).paddingOnly(bottom: 10),
        ),
      ),
    );
  }
}
