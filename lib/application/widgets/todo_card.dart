import 'package:flutter/material.dart';
import 'package:todoapps/domain/entity/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(
      {super.key,
      required this.item,
      required this.onTap,
      required this.onTapStatus});
  final ToDoEntity item;
  final VoidCallback onTap;
  final VoidCallback onTapStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: onTapStatus,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: item.status ?? false
                                ? Colors.blue
                                : Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: item.status ?? false
                            ? const Icon(
                                Icons.radio_button_checked,
                                color: Colors.blue,
                                size: 18.0,
                              )
                            : const Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.grey,
                                size: 18.0,
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          item.title ?? "",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Created at ${item.createdAt}",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
