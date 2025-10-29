import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notepad/controller/notes_controller.dart';
import 'package:notepad/routes/route_names.dart';
import 'package:notepad/utils/colors.dart';
import 'package:get/get.dart';

class CustomSingleNotes extends StatelessWidget {
  final int index;
  final QueryDocumentSnapshot<Map<String, dynamic>> data;

  const CustomSingleNotes({super.key, required this.index, required this.data});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    final note = data;

    DateTime createdDate = (note['created_date'] as Timestamp).toDate();
    DateTime updatedDate = note['updated_date'] == null
        ? DateTime.now()
        : (note['updated_date'] as Timestamp).toDate();

    final createdDateFormat = DateFormat.yMMMd().format(createdDate);
    final createdTimeFormat = DateFormat.jm().format(createdDate);

    final updateDateFormat = DateFormat.yMMMd().format(updatedDate);
    final updateTimeFormat = DateFormat.jm().format(updatedDate);

    return InkWell(
      onTap: () {
        Get.toNamed(
          RouteNames.noteScreen,
          arguments: {'isUpdate': true, 'note': note, 'index': index},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black26),
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.backgroundColor,
            ),
          ),
          title: Text(
            note['title'],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note['description'],
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black54,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              note['updated_date'] != null
                  ? Text(
                      'Update : $updateDateFormat - $updateTimeFormat',
                      style: TextStyle(color: Colors.black54, fontSize: 11),
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$createdDateFormat - $createdTimeFormat',
                    style: TextStyle(color: Colors.black54, fontSize: 11),
                  ),
                  InkWell(
                    onTap: () {
                      Get.snackbar(
                        'Deleted',
                        '${note['title']} has been deleted',
                      );
                      controller.deleteNote(note.id);
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
