import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringBuilderToStringScreen extends StatefulWidget {
  const StringBuilderToStringScreen({super.key, required this.title});

  final String title;

  @override
  State<StringBuilderToStringScreen> createState() => _StringBuilderToStringScreenState();
}

class _StringBuilderToStringScreenState extends State<StringBuilderToStringScreen> {
  String _originalText = '';
  final Key _form = GlobalKey();

  void _onInputChange(String text) {
    _originalText = text;
  }

  String _getResult() {
    String result = "";
    List<String> temp = _originalText.split("\n");
    for (var text in temp) {
      if (result != "") {
        result += "\n";
      }
      text = text.replaceAll(RegExp(r'^\s*'), '');
      text = text.replaceAll(RegExp(r'sql.append\("'), '');
      text = text.replaceAll(RegExp(r'\s*"\);'), '');
      result += text;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextField(
                      maxLines: 1000,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary,
                        border: const OutlineInputBorder(),
                        icon: const Icon(Icons.text_fields),
                        hintText: 'Enter string builder text...',
                        labelText: 'String builder',
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
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
        ),
      ),
    );
  }
}
