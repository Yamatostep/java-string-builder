import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringBuilderScreen extends StatefulWidget {
  const StringBuilderScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StringBuilderScreen> createState() => _StringBuilderScreenState();
}

class _StringBuilderScreenState extends State<StringBuilderScreen> {
  String _originalText = '';
  final Key _form = GlobalKey();

  void _onInputChange(String text) {
    _originalText = text;
  }

  String _getResult() {
    String temp = _originalText;
    temp = temp.replaceAll(RegExp(r' \n'), '\n');
    temp = temp.replaceAll(RegExp(r'\n'), ' ");\nsql.append("');
    return "sql.append(\"$temp\");";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  maxLines: 1000,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.text_fields),
                    hintText: 'Enter sql text...',
                    labelText: 'SQL String',
                  ),
                  onChanged: _onInputChange,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 2,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _getResult()));
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('Copy to clipboard'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
