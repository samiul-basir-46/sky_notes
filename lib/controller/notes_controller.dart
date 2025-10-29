import 'package:get/get.dart';
import 'package:notepad/models/notes_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesController extends GetxController {
  // RxList<NotesModel> notes = <NotesModel>[].obs;
  final fireStore = FirebaseFirestore.instance;

  addNotes(NotesModel notesData) {
    fireStore.collection('notes').add({
      'title': notesData.title,
      'description': notesData.description,
      'created_date': notesData.createdDate,
      'updated_date': notesData.updatedTime,
    });
    update();
  }

  deleteNote(String docID) {
    fireStore.collection('notes').doc(docID).delete();
    // notes.removeAt(index);
  }

  updateNote(String docID, NotesModel notesData) {
    fireStore.collection('notes').doc(docID).update({
      'title': notesData.title,
      'description': notesData.description,
      'created_date': notesData.createdDate,
      'updated_date': notesData.updatedTime,
    });
  }
}
