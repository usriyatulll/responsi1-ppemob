import 'package:flutter/material.dart';
import 'package:responsi1/bloc/tugas_bloc.dart';
import 'package:responsi1/model/tugas.dart';
import 'package:responsi1/ui/tugas_form.dart';
import 'package:responsi1/ui/tugas_detail.dart';

class TugasPage extends StatefulWidget {
  const TugasPage({Key? key}) : super(key: key);

  @override
  _TugasPageState createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                // Navigasi ke halaman TugasForm untuk menambahkan tugas baru
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TugasForm(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Tugas>>(
        future: TugasBloc.getTugas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('Terjadi kesalahan'),
            );
          }
          return snapshot.hasData
              ? ListTugas(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemTugas extends StatelessWidget {
  final Tugas tugas;

  const ItemTugas({Key? key, required this.tugas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TugasDetail(
              tugas: tugas,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(tugas.title!),
          subtitle: Text(tugas.description.toString()),
        ),
      ),
    );
  }
}

class ListTugas extends StatelessWidget {
  final List<Tugas>? list;

  const ListTugas({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list?.length ?? 0,
      itemBuilder: (context, i) {
        return ItemTugas(
          tugas: list![i],
        );
      },
    );
  }
}
