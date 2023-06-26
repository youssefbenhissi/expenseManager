import 'package:expense_manager/app_page_injectable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});
  @override
  ContactUsPageState createState() => ContactUsPageState();
}

class ContactUsPageState extends State<ContactUsPage> {
  Color darkGrey = const Color(0xff202020);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact US"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.gNavigationService.openSettings(context),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                    left: 24.0, right: 24.0, bottom: 16.0, top: 16),
              ),
              SizedBox(
                  height: height / 7,
                  child: GridView.count(
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 4,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      children: [
                        GFIconButton(
                          onPressed: () {},
                          color: Colors.green,
                          icon: const Icon(Icons.phone),
                          size: GFSize.SMALL,
                        ),
                        GFIconButton(
                          onPressed: () {},
                          color: Colors.red,
                          icon: const Icon(Icons.email),
                          size: GFSize.SMALL,
                        ),
                        GFIconButton(
                          onPressed: () {},
                          color: Colors.blue,
                          icon: const Icon(FontAwesomeIcons.facebookMessenger),
                          size: GFSize.SMALL,
                        ),
                        GFIconButton(
                          onPressed: () {},
                          color: Colors.green,
                          icon: const Icon(Icons.whatshot),
                          size: GFSize.SMALL,
                        ),
                      ])),
              GFIconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                size: GFSize.SMALL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
