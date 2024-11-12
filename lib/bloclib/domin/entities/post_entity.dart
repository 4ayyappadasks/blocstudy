import 'package:equatable/equatable.dart';

class PostEnity extends Equatable {
  var id;
  var userid;
  var title;
  var body;

  PostEnity({
    required this.body,
    required this.title,
    required this.id,
    required this.userid,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.userid, this.id, this.title, this.body];
}
