import 'package:tiktok_clone/models/user.dart';
import 'package:tiktok_clone/models/video.dart';

User currentUser = User("stackedlist",  "https://pngroyale.com/wp-content/uploads/2022/03/Lionel-Messi-PNG-Free-Download.png");

User demoUser1 = User("user1", "https://futhead.cursecdn.com/static/img/22/players_alt/p50570442.png");

User demoUser2 = User("user_2", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSygaBAXCiNpcUDPgYQ7S1f-HkwKLHetvEVcaAHyk-FEQLE_kXogSyRZcASQKWaHf3O3Mw&usqp=CAU");

User demoUser3 = User("user_3", "https://1.bp.blogspot.com/-EkYLLXpNHog/XeVrUnE3-KI/AAAAAAAAF6M/H7fiZn5mD7E2uQjm8Q7TFES3r_E7mmHngCLcBGAsYHQ/s1600/rodrigo-real-madrid-png-867x600px.PNG");

User demoUser4 = User("user_4", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlzyzZYFgbQaBN9U0znfnq6QjmjuWAyel9Gj3zAtgUhOE64PazrdgVbS_KBbJYUkoBhw0&usqp=CAU");


final List<Video> videos= [
  Video("v1.mp4", demoUser1, "caption", "audioName", "12.5k", "140"),
  Video("v2.mp4", demoUser2, "caption", "audioName", "55.5k", "140"),
  Video('v3.mp4', demoUser3, "caption", "audioName", "115.5k", "140"),
  Video('v4.mp4', demoUser4, "caption", "audioName", "100.5k", "140"),
];