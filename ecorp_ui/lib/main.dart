import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.black,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.black,
                    height: 140,
                    width: 200,
                    child: const Image(
                      image: AssetImage(
                        'assets/ecorp.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    "ECORPS",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: TextField(
                            controller: userNameController,
                            decoration: InputDecoration(
                                hintText: 'email',
                                fillColor: Colors.blueGrey.shade100,
                                filled: true,
                                hintStyle: const TextStyle(color: Colors.black),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: passWordController,
                            obscureText: isShow,
                            decoration: InputDecoration(
                                hintText: 'password',
                                fillColor: Colors.blueGrey.shade100,
                                filled: true,
                                hintStyle: const TextStyle(color: Colors.black),
                                prefixIcon: const Icon(
                                  Icons.lock_open,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: isShow
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isShow = !isShow;
                                    });
                                  },
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "forgot password?",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(
                                    text: userNameController.text,
                                    pass: passWordController.text,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              minimumSize:
                                  Size(MediaQuery.sizeOf(context).width, 50),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String text;
  final String pass;
  const Profile({super.key, required this.text, required this.pass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          "Main Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // Text(
            //   "user Name : $text",
            //   style: const TextStyle(
            //     color: Colors.black,
            //     fontSize: 40,
            //     fontWeight: FontWeight.bold,
            //     wordSpacing: 2,
            //   ),
            // ),
            Image(image: AssetImage('assets/meme.png')),
          ],
        ),
      ),
    );
  }
}

Widget buildTextBlue(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.blue,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}
