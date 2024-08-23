import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/tag_model.dart';
import 'package:myapp/app/modules/Tag/controllers/tag_controller.dart';

class CreateTagView extends StatelessWidget {
  final TagController controller = Get.find();
  final TextEditingController nameTagController = TextEditingController();
  final TextEditingController slugTagController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Tag',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Tag',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameTagController,
              decoration: InputDecoration(
                labelText: 'Name Tag',
                labelStyle: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),  
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  final newTags = DataTag (
                    namaTag: nameTagController.text,
                    slug: slugTagController.text,
                  );
                  controller.addTag(newTags);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  

