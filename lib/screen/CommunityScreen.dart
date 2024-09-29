import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<String> _messages = [];
  final TextEditingController _messageController = TextEditingController();

  void _postMessage() {
    setState(() {
      _messages.add(_messageController.text);
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Discussion'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(labelText: 'Write a message'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _postMessage,
            child: Text('Post Message'),
          ),
        ],
      ),
    );
  }
}
