import 'package:http/http.dart' as http;
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk.dart';
void whistle_loop_events(String eventname) async{

  String? device_id = await WhistleLoopStagingsdk().initDeviceId();
  String? package_name= await WhistleLoopStagingsdk().getpac();
  String? network_type= await WhistleLoopStagingsdk().getConnectionType();
  String? ip= await WhistleLoopStagingsdk().getIP();
  String? user_agent= await WhistleLoopStagingsdk().getPlatform();
  String? clicked_time= await WhistleLoopStagingsdk().getTime();
  String? clicked_date= await WhistleLoopStagingsdk().getDate();
  String? platform_os= await WhistleLoopStagingsdk().getDeviceType();

  var request = http.Request('POST', Uri.parse('http://13.232.216.75/whistle-follow-utils/sdk_test.php?device_id=$device_id&event_name=$eventname&package_name=$package_name&network_type=$network_type&ip=$ip&user_agent=$user_agent&clicked_time=$clicked_time&clicked_date=$clicked_date&platfom_os=$platform_os'));
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print("sfhdsuyfgvudsgfusdgvf");
  print(await response.stream.bytesToString());



  }
  else {
  print(response.reasonPhrase);
  }

}