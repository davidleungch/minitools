import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeeSpliter extends StatefulWidget {
  const FeeSpliter({super.key});

  @override
  _FeeSpliterState createState() => _FeeSpliterState();
}

class _FeeSpliterState extends State<FeeSpliter> {
  String description = '';
  double amount = 0.0;
  String paidBy = '';
  List<String> stakeholders = [];
  String user = '';
  List<String> users = [];
  List<Object> transactions = [];
  List<bool> selectedUsers = <bool>[];

  //Controller
  final TextEditingController textController = TextEditingController();
  final TextEditingController paidByController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Total people:'),
                  Text(users.length.toString()),
                  const SizedBox(width: 10),
                  const Text('Total transactions:'),
                  Text(transactions.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    child: const Text('Add Transaction'),
                    onPressed: () => {
                      if (users.isNotEmpty)
                        {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => AlertDialog(
                                    title: const Text('Add Transaction'),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Description',
                                            ),
                                            onChanged: (value) => setState(() {
                                              description = value;
                                            }),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: '\$\$\$ Amount',
                                            ),
                                            onChanged: (value) => setState(() {
                                              amount = double.parse(value);
                                            }),
                                          ),
                                          const SizedBox(height: 10),
                                          DropdownMenu(
                                              width: 150,
                                              controller: paidByController,
                                              label: const Text('Paid by'),
                                              dropdownMenuEntries: users
                                                  .map((e) => DropdownMenuEntry(
                                                        label: e,
                                                        value: e,
                                                      ))
                                                  .toList(),
                                              onSelected: (value) =>
                                                  setState(() {
                                                    paidBy = value.toString();
                                                  })),
                                          const SizedBox(height: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Stakeholders",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                              ToggleButtons(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  selectedBorderColor:
                                                      Colors.grey,
                                                  selectedColor: Colors.white,
                                                  fillColor: Colors.black54,
                                                  isSelected: selectedUsers,
                                                  onPressed: (int index) {
                                                    log(index);
                                                    setState(() {
                                                      selectedUsers[index] =
                                                          !selectedUsers[index];
                                                    });
                                                  },
                                                  children: [
                                                    for (var user in users)
                                                      Text(user)
                                                  ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text('Confirm')),
                                      TextButton(
                                          onPressed: () {
                                            paidByController.clear();
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Close'))
                                    ],
                                  ))
                        }
                      else
                        {null}
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        users = [];
                        transactions = [];
                        user = '';
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
          TextField(
            controller: textController,
            onChanged: (value) {
              setState(() {
                user = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User name',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      if (user != '') {
                        users.add(user);
                        selectedUsers.add(false);
                      }
                      user = '';
                      textController.clear();
                    });
                  },
                  child: const Text('Add User')),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Users Table',
              style: TextStyle(
                  fontSize: 17, decoration: TextDecoration.underline)),
          const SizedBox(height: 10),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(children: [
                Center(child: Text('Name')),
                Center(child: Text('Debt')),
                Center(child: Text('Income')),
                Center(child: Text('Remove')),
              ]),
              for (var user in users)
                TableRow(children: [
                  Center(child: Text(user)),
                  Center(
                      child: Text(
                          (transactions.length / users.length).toString())),
                  Center(
                      child: Text(
                          (transactions.length / users.length).toString())),
                  IconButton(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          users.remove(user);
                          selectedUsers.remove(false);
                        });
                      },
                      icon: const Icon(Icons.delete))
                ]),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Transactions",
            style:
                TextStyle(fontSize: 17, decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 10),
          Table(
            children: const [
              TableRow(children: [
                Center(child: Text('Description')),
                Center(child: Text('Amount')),
                Center(child: Text('Paid by')),
                Center(child: Text('Stakeholders')),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
