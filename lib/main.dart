import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: otpapp(),
    ),
  );
}

class otpapp extends StatefulWidget {
  const otpapp({Key? key}) : super(key: key);

  @override
  State<otpapp> createState() => _otpappState();
}

class _otpappState extends State<otpapp> {
  int? length;
  List generator = [];
  Random r = Random();
  int? ANS;
  TextEditingController lengthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "OTP_App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.qr_code,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff141e30),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            const Text(
              "OTP Generator",
              style: TextStyle(
                  color: Color(0xffffd89b),
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: TextField(
                controller: lengthController,
                decoration: const InputDecoration(
                  hintText: "Enter OTP Length.(Maximum 8)",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xffffd89b),
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  length = int.parse(val);
                },
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  if (length == 4 || length == 6 || length == 8) {
                    generator.clear();
                    for (int a = 0; a < length!; a++) {
                      ANS = r.nextInt(10);
                      generator.add(ANS);
                    }
                  } else {
                    generator.clear();
                    generator.add("Invelid OTP length");
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: h * 0.08,
                width: w * 0.8,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: const Text(
                  "Generate OTP",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
                alignment: Alignment.center,
                height: h * 0.10,
                width: w * 0.9,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: generator.map((e) {
                    return Text(
                      "$e",
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    );
                  }).toList(),
                )),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  generator.clear();
                  length = 0;
                  lengthController.clear();
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: h * 0.08,
                width: w * 0.6,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      backgroundColor: const Color(0xff141e30),
    );
  }
}
