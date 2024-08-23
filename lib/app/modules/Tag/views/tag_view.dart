import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:myapp/app/data/tag_model.dart';

import '../controllers/tag_controller.dart';

class TagView extends GetView<TagController> {
  TagView({Key? key}) : super(key: key);
  final TagController controller = Get.put(TagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tag View',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 20),
            onPressed: () => Get.toNamed('/tag/create'),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: controller.TagList.length,
            itemBuilder: (context, index) {
              final tag = controller.TagList[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  title: Text(
                    tag.namaTag ?? 'No Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  subtitle: Text(
                    tag.slug ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.deepPurpleAccent),
                        onPressed: () => Get.toNamed(
                          '/tag/update',
                          arguments: tag,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.deleteTag(tag.id!),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed(
                    '/tag/show',
                    arguments: tag,
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}
