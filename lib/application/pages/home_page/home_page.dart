import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapps/application/pages/add_page/add_page.dart';
import 'package:todoapps/application/pages/home_page/cubit/todo_cubit.dart';
import 'package:todoapps/application/widgets/custom_button.dart';
import 'package:todoapps/application/widgets/todo_card.dart';
import 'package:todoapps/domain/entity/todo.dart';
import 'package:todoapps/injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() {
    BlocProvider.of<HomeCubit>(context).todoRequest();
  }

  void updateStatus(ToDoEntity toDoEntity, bool status){
    BlocProvider.of<HomeCubit>(context).updateStatus(toDoEntity, status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        body: body(context));
  }

  Widget body(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeDone) {
                  return ListView.builder(
                    itemCount: state.listToDo.length,
                    itemBuilder: (context, index) {
                      final data = state.listToDo[index];
                      return TodoCard(
                          item: data,
                          onTap: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailPage(
                                          item: data,
                                        )));
                            if (result == true) {
                              refreshData();
                            }
                          },
                          onTapStatus: () {
                            updateStatus(data, !data.status!);
                            refreshData();
                          });
                    },
                  );
                } else if (state is HomeEmpty) {
                  return const Center(
                    child: Text("Kosong"),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )),
            CustomButton(
              onTap: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DetailPage()));
                if (result == true) {
                  refreshData();
                }
              },
              title: "ADD NEW",
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      );
  }

  PreferredSizeWidget appbar() {
    return AppBar(
        title: const Text("ToDo Apps"),
        backgroundColor: Colors.blue,
      );
  }
}
