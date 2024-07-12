import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapps/application/pages/add_page/cubit/detail_cubit.dart';
import 'package:todoapps/application/widgets/custom_button.dart';
import 'package:todoapps/domain/entity/todo.dart';
import 'package:todoapps/injection.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.item});
  final ToDoEntity? item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DetailCubit>(),
      child: DetailContent(
        item: item,
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  const DetailContent({super.key, this.item});
  final ToDoEntity? item;

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool _isEdit = false;
  bool? _isChecked = false;

  addTodo() async {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    BlocProvider.of<DetailCubit>(context).addToDo(ToDoEntity(
        title: titleController.text,
        description: descriptionController.text,
        createdAt: formattedDate,
        updatedAt: formattedDate,
        status: false));
  }

  updateTodo() async {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    BlocProvider.of<DetailCubit>(context).updateToDo(ToDoEntity(
        id: widget.item?.id,
        title: titleController.text,
        description: descriptionController.text,
        createdAt: widget.item?.createdAt ?? "",
        updatedAt: formattedDate,
        status: _isChecked));
  }

  removeTodo() async {
    BlocProvider.of<DetailCubit>(context).removeTodo(widget.item!);
  }

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _isEdit = true;
      _isChecked = widget.item?.status;
      titleController.text = widget.item?.title ?? "";
      descriptionController.text = widget.item?.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(),
    );
  }

  Widget body() {
    return BlocBuilder<DetailCubit, DetailState>(
      builder: (context, state) {
        if (state is DetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailDone) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pop(context, true);
          });
          return const SizedBox.shrink();
        } else {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Title",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            hintText: 'ToDo Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'ToDo Description',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Visibility(
                          visible: _isEdit,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _isChecked,
                                  onChanged: (valule) {
                                    setState(() {
                                      _isChecked = valule;
                                    });
                                  }),
                              const Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      _isEdit ? updateTodo() : addTodo();
                    },
                    title: _isEdit ? "UPDATE" : "SAVE",
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: _isEdit,
                    child: CustomButton(
                      onTap: () {
                        removeTodo();
                      },
                      title: "DELETE",
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  PreferredSizeWidget appbar() {
    return AppBar(
      title: const Text("Add New"),
      backgroundColor: Colors.blue,
    );
  }
}
