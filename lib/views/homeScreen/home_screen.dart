import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/controller/notes_controller.dart';
import 'package:notepad/routes/route_names.dart';
import 'package:notepad/utils/colors.dart';
import 'package:notepad/widget/custom_single_notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    return Scaffold(
      body: Container(
        color: AppColor.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My Notes',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder(
                            stream: controller.fireStore
                                .collection('notes')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  reverse: false,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final data = snapshot.data!.docs[index];
                                    return CustomSingleNotes(
                                      index: index,
                                      data: data,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        shape: CircleBorder(),
        onPressed: () => Get.toNamed(RouteNames.noteScreen),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
