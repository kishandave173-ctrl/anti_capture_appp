import 'package:flutter/material.dart';

void main() {
  runApp(const AntiCaptureApp());
}

class AntiCaptureApp extends StatelessWidget {
  const AntiCaptureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SecureViewer(),
    );
  }
}

class SecureViewer extends StatefulWidget {
  const SecureViewer({super.key});

  @override
  State<SecureViewer> createState() => _SecureViewerState();
}

class _SecureViewerState extends State<SecureViewer> {
  bool showIdea = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onLongPressStart: (_) => setState(() => showIdea = true),
        onLongPressEnd: (_) => setState(() => showIdea = false),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: showIdea
                ? const Text(
                    "MY SECRET IDEA (demo)",
                    key: ValueKey(1),
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                : Container(
                    key: const ValueKey(2),
                    width: 300,
                    height: 200,
                    color: Colors.grey.shade900,
                    child: const Center(
                      child: Text(
                        "Press & hold with 2 fingers to reveal",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
