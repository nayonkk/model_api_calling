import 'package:flutter/material.dart';
import 'package:model_api/Model/model.dart';
import 'package:model_api/Services/Remote_Service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await Remote_Service().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              var location = posts![index];
              return Card(
                elevation: 0,
                color: Colors.grey.shade900,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID Number :${location.id}",
                        style: const TextStyle(color: Colors.teal),
                      ),
                      Text("ID Title : ${location.title}"),
                      Text(
                        location.url,
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(location.image),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
