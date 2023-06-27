import 'package:chatty/common/entities/entities.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChatState{
  RxList<Msgcontent> msgcontentList = <Msgcontent>[].obs;
  
  var to_token = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_online = "".obs;
}