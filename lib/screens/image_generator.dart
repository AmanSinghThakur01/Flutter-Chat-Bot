import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stability_image_generation/stability_image_generation.dart';

class AitexttoImageGenerator extends StatefulWidget {
  const AitexttoImageGenerator({super.key});

  @override
  State<AitexttoImageGenerator> createState() => _AitexttoImageGeneratorState();
}

class _AitexttoImageGeneratorState extends State<AitexttoImageGenerator> {
  final TextEditingController _queryController = TextEditingController();
  final StabilityAI _ai = StabilityAI();
  final String apiKey = 'sk-AqCgA5FzTzKPdELAJDOmPrw54EbmLnTLQ8l78qcd4nmNx9gC';
  final ImageAIStyle imageAIStyle = ImageAIStyle.digitalPainting;
  bool isItems = false;

  Future<Uint8List> _generate(String query) async {
    Uint8List image = await _ai.generateImage(
      apiKey: apiKey,
      imageAIStyle: imageAIStyle,
      prompt: query,
    );
    return image;
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Flutter Chat bot "),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal
                ),
                child: Text("Header"),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item tap
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff65d0e8), // Blue
              Color(0xfff890f5), // Light Blue
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "How can I help you?",
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 30,

                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _queryController,
                  decoration: const InputDecoration(
                    hintText: "Ask anything",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, top: 5),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(20),
              child: isItems//cheeck if the images have been generated ,
                ? FutureBuilder<Uint8List>(
                future: _generate(
                  _queryController.text),//caliing the generate function
             builder: (context,snapshot)  {
                  if (snapshot.connectionState==
                  ConnectionState.waiting){
                      //show loading indicator while waiting for the image
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                    }
                  else if(snapshot.hasData){
                    //if the date is recieved , display  the generated image
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(snapshot.data!),
                    );
                  }
                  else {
                    return Container();
                  }

                  },
              )
                  : const Center(
                child: Text(
                  "No any image generated yet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String query= _queryController.text;
                  if (query.isNotEmpty){
                    setState(() {
                      isItems= true;
                    });
                  }else {
                    if(kDebugMode){
                      print('Query is empty !!');
                    }
                  }
                },
                child: const Text("Generate Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
