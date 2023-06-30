import 'package:flutter/material.dart';
import './src/fee_spliter/application/counter_page.dart';
import './src/fee_spliter/application/counter_cubit.dart';
import './src/utils/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            DropDown(),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                  context: context, builder: (_) => const Settings()),
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: BlocProvider(
          create: (_) => CounterCubit(), child: const CounterPage()),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final items = ['1', '2', '3', '4', '5'];
  String? value;
  @override
  Widget build(BuildContext context) {
    value = value ?? items.first;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: DropdownButton(
          value: value,
          items: items.map(buildItem).toList(),
          onChanged: (value) => setState(() {
                this.value = value;
              })
      ),
    );
  }

  DropdownMenuItem<String> buildItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
