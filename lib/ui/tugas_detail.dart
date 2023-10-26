import 'package:flutter/material.dart';
import 'package:responsi1/bloc/tugas_bloc.dart';
import 'package:responsi1/model/tugas.dart';
import 'package:responsi1/ui/tugas_form.dart';
import 'package:responsi1/ui/tugas_page.dart';

class TugasDetail extends StatefulWidget {
  Tugas? tugas;
  TugasDetail({Key? key, this.tugas}) : super(key: key);

  @override
  _TugasDetailState createState() => _TugasDetailState();
}

class _TugasDetailState extends State<TugasDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Id : ${widget.tugas!.id}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Title : ${widget.tugas!.title}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Description : ${widget.tugas!.description}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Deadline : ${widget.tugas!.deadline}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolEditDelete()
          ],
        ),
      ),
    );
  }

  Widget _tombolEditDelete() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TugasForm(
                            tugas: widget.tugas!,
                          )));
            }),
        // Tombol Delete
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            TugasBloc.deleteTugas(id: widget.tugas!.id);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TugasPage()));
          },
        ),
        // Tombol Batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
