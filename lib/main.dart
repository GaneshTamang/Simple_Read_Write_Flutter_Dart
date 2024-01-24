import 'package:file_handling_examples/homepage.dart';
import 'package:file_handling_examples/providing_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ProvidingData(),
      ),
    ],
    child: const FileHandlingApp(),
  ));
}

class FileHandlingApp extends StatelessWidget {
  const FileHandlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
//better to put in consumer for easy use

// Consumer<ProvidingData>(
//         builder: (context, dataProvidedToconsume, child) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // Text('${context.watch<ProvidingData>().getcounter}'),
//               Text('${dataProvidedToconsume.getcounter}'),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       print('pressed');
//                       // context.read<ProvidingData>().setcounter();
//                       dataProvidedToconsume.setcounter();
//                     },
//                     child: Text("Increase counter"),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
