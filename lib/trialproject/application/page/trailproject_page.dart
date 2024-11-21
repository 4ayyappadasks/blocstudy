import 'package:flutter/material.dart';

class TrailprojectPage extends StatelessWidget {
   TrailprojectPage({super.key});
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B00C0),
        foregroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        title: const Text(
          "Trail Project",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // List Section
          Expanded(
            flex: 9,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 25,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text("Item $index"), // Dynamic item
                  ),
                );
              },
            ),
          ),
          // Input Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                // Text Field
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "Enter message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                // Send Button
                IconButton(
                  onPressed: () {
                    final message = textController.text.trim();
                    FocusScope.of(context).unfocus();
                    if (message.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Message sent: $message")),
                      );
                      textController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Message cannot be empty!")),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFF4B00C0), // Purple shade
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
