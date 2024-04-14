import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringBuilderScreen extends StatefulWidget {
  const StringBuilderScreen({super.key, required this.title});

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
    return "sql.append(\"$temp\" );";
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
