import 'dart:math';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.planetName, required this.imagePath})
      : super(key: key);
  String imagePath;
  String planetName;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final animation =
  Tween(begin: 0, end: 2 * pi).animate(animationController);

  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          title: const Text("Galaxy")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Container(
                          height: 200,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                widget.planetName,
                                style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 65,
                      top: 60,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 500,
                                  width: double.infinity,
                                  color: Colors.black,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 450,
                                        color: Colors.blueAccent,
                                        child: Center(
                                          child: Text(
                                              "Welcome To ${widget.planetName}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Container(
                                        height: 120,
                                        width: 120,
                                        child: Image.asset(widget.imagePath),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Distance to Sun",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const Text("66.8 million km",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        "Distance to Earth",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const Text("128.88 million km",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: animation.value.toDouble(),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(widget.imagePath))),
                                // child: Image.asset(
                                //     Reso.planetInfoList[index]["imagePath"]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Overview",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "The Milky Way as a whole is moving at a velocity of approximately 600 km per second with respect to extragalactic frames of reference. The oldest stars in the Milky Way are nearly as old as the Universe itself and thus probably formed shortly after the Dark Ages",
                  style:
                  TextStyle(fontSize: 10, color: Colors.grey, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 57,
              width: 450,
              color: Colors.blueAccent,
              alignment: Alignment.centerLeft,
              child: const Text("  <Back   ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}