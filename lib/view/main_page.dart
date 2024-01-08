import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebaseodev/view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
        centerTitle: true,
        backgroundColor: Colors.red.shade600,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          viewModel.openAddCharacterPage(context);
        },
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(children: [ Text(viewModel.characters[index].name),
              Text(" "),
              Text(viewModel.characters[index].surname),
        ],
            ),

            subtitle: Row(children: [
              Text(viewModel.characters[index].gender),
              Text("- Age:"),
              Text(viewModel.characters[index].age),
            ],
          ),
          );
        },
      ),
    );
  }
}



