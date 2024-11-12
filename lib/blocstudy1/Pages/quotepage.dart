import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../QuoteBloc/quotbloc_bloc.dart';
import 'Widgets/Custombutton.dart';
import 'Widgets/Errorwidget.dart';
import 'Widgets/Quoteloadedwidet.dart';

// class Quotepageloade extends StatelessWidget {
//   const Quotepageloade({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => QuotblocBloc(),
//       child: Quotepage(),
//     );
//   }
// }

class Quotepage extends StatelessWidget {
  const Quotepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuotblocBloc(),
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<QuotblocBloc, QuotblocState>(
                        builder: (context, state) {
                          if (state is QuotblocInitial) {
                            return Center(child: Text("Quote is wating"));
                          } else if (state is QuoteLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            );
                          } else if (state is QuoteLoaded) {
                            return Quoteloadedwidet(msg: state.msg);
                          } else if (state is QuotError) {
                            return Errorwidgets(msg: state.errormsg);
                          } else
                            return Errorwidgets(msg: "Someting Went wrong");
                        },
                      ),
                    )),
                Custombutton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
