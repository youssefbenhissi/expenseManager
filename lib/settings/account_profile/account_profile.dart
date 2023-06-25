import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () => {}, icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/avatar.png",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Full Name'),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('E-mail'), prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Phone No'),
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Password'),
                          prefixIcon: Icon(Icons.password)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
