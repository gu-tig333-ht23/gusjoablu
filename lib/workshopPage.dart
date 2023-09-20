import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'homePage.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFFFFBFC),
      appBar: AppBar(
        title: Text('Workshop'),
        backgroundColor: Color(0xFF285238),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            //Input textfield
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'What would you like to add?',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.orange), // Set the border color when focued
                ),
                suffixIcon: IconButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    textEditingController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButton(
                  onPressed: () {
                    //Adding new item as textfield
                    var newItem = textEditingController.text;
                    context.read<MyState>().addItem(newItem, false);

                    //pop function.
                    Navigator.of(context).pop();
                  },

                  //Push knappen "Add It" style.
                  color: Color.fromARGB(255, 0, 0, 0),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Add It!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
