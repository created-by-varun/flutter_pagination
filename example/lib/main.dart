import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 1;

  setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Pagination"),
          backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pagination(
              numOfPages: 10,
              selectedPage: selectedPage,
              pagesVisible: 5,
              spacing: 10,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              nextIcon: const Icon(
                Icons.chevron_right_rounded,
                color: Colors.redAccent,
                size: 20,
              ),
              previousIcon: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.redAccent,
                size: 20,
              ),
              activeTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              activeBtnStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                shape: MaterialStateProperty.all(const CircleBorder(
                  side: BorderSide(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                )),
              ),
              inactiveBtnStyle: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(const CircleBorder(
                  side: BorderSide(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                )),
              ),
              inactiveTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Pagination(
              numOfPages: 10,
              selectedPage: selectedPage,
              pagesVisible: 5,
              spacing: 10,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              nextIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
              previousIcon: const Icon(
                Icons.arrow_back_ios,
                size: 14,
              ),
              activeTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              activeBtnStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
              ),
              inactiveBtnStyle: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                )),
              ),
              inactiveTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Pagination(
              numOfPages: 10,
              selectedPage: selectedPage,
              pagesVisible: 5,
              spacing: 10,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              nextIcon: const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.amberAccent,
                size: 35,
              ),
              previousIcon: const Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.amberAccent,
                size: 35,
              ),
              activeTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              activeBtnStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                elevation: MaterialStateProperty.all(15),
              ),
              inactiveBtnStyle: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
              ),
              inactiveTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.amber,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
