import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = "talk";
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nom Conférence",
                    hintText: "Entrer le nom de la confrence",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "tu dois complêter ce champ";
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nom du Speaker",
                    hintText: "Entrer le nom du speaker",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "tu dois complêter ce champ";
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: "talk", child: Text("Talk show")),
                    DropdownMenuItem(value: "demo", child: Text("Demo code")),
                    DropdownMenuItem(value: "partner", child: Text("Partner")),
                  ],
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  value: "talk",
                  onChanged: (value) {
                    setState(() {
                      selectedConfType = value!;
                    });
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Choisir une date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final confName = confNameController.text;
                      final speakerName = speakerNameController.text;

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("envoien cours...")));
                      FocusScope.of(context).requestFocus(FocusNode());

                      // ignore: avoid_print
                      print(
                          "Ajout de la conf $confName par le speaker $speakerName");
                      // ignore: avoid_print
                      print("Type de conference $selectedConfType");
                      // ignore: avoid_print
                      print("Datede la conference $selectedConfDate");
                    }
                  },
                  child: const Text("Envoyer")),
            ),
          ],
        ),
      ),
    );
  }
}
