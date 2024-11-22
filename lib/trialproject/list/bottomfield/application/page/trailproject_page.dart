import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../listview/application/bloc/trailerprojectlist_bloc.dart';
import '../bloc/trailproject_bloc.dart';


class TrailprojectBottomsheetwrapper extends StatelessWidget {
  const TrailprojectBottomsheetwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailprojectBloc(
        trailerprojectlistBloc: context.read<TrailerprojectlistBloc>(),
      ),
      child: TrailprojectBottomSheet(),
    );
  }
}

class TrailprojectBottomSheet extends StatelessWidget {
  TrailprojectBottomSheet({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrailprojectBloc, TrailprojectState>(
      listener: (context, state) {
        if (state is Trailprojectloaded) {
          Fluttertoast.showToast(
            msg: "Message sent: ${state.trialprojectentity.title}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        } else if (state is Trailprojecterror) {
          Fluttertoast.showToast(
            msg: state.ermsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border(top: BorderSide(color: Colors.grey[300]!)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Enter message...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () {
                  final message = textController.text.trim();
                  FocusScope.of(context).unfocus();
                  if (message.isNotEmpty) {
                    context
                        .read<TrailprojectBloc>()
                        .add(Postmethodevent(message: message));
                    textController.clear();
                  } else {
                    Fluttertoast.showToast(
                      msg: "Message cannot be empty!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  }
                },
                icon: state is Trailprojectloading
                    ? const CircularProgressIndicator(
                        color: Color(0xFF4B00C0),
                      )
                    : const Icon(
                        Icons.send,
                        color: Color(0xFF4B00C0),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
