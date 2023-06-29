import 'package:expense_manager/app_page_injectable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApplicationSettingsPage extends StatefulWidget {
  const ApplicationSettingsPage({super.key});

  @override
  ApplicationSettingsPageState createState() => ApplicationSettingsPageState();
}

class ApplicationSettingsPageState extends State<ApplicationSettingsPage> {
  late bool _dark;
  late bool _newsLetter;

  @override
  void initState() {
    super.initState();
    _dark = false;
    _newsLetter = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle:
              _dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.gNavigationService.openSettings(context),
          ),
          title: Text(
            'Application Settings',
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.language,
                            color: Colors.purple,
                          ),
                          title: const Text("Change Language"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change language
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: _dark,
                    title: const Text("Dark/Light Theme"),
                    onChanged: (val) {
                      setState(() {
                        _dark = !_dark;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: _newsLetter,
                    title: const Text("Received newsletter"),
                    onChanged: (val) {
                      setState(() {
                        _newsLetter = !_newsLetter;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: const Text("Received Offer Notification"),
                    onChanged: (val) {},
                  ),
                  const SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: EdgeInsets.all(0),
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null,
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
