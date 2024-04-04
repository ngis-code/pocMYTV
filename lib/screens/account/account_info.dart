import 'package:flutter/material.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(.2),
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(.5),
                      Colors.white.withOpacity(.1),
                      Colors.blue.withOpacity(.9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              {
                                return Card(
                                    child: ExpansionTile(
                                  title: Text("User $index"),
                                ));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
