// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TopicPage extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ThreadBloc()..add(FetchThreads()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('กระทู้'),
//         ),
//         body: Column(
//           children: [
//             // ส่วนค้นหา
//             TextField(
//               decoration: InputDecoration(labelText: 'ค้นหา'),
//               onChanged: (query) {
//                 // ดำเนินการค้นหาโดยส่งอีเวนต์หาใน Bloc
//               },
//             ),
//             BlocBuilder<ThreadBloc, ThreadState>(
//               builder: (context, state) {
//                 if (state is ThreadLoading) {
//                   return CircularProgressIndicator();
//                 } else if (state is ThreadLoaded) {
//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: state.threads.length,
//                       itemBuilder: (context, index) {
//                         final thread = state.threads[index];
//                         return ListTile(
//                           title: Text(thread.title),
//                           subtitle: Text(thread.user.name),
//                           // เพิ่มรายละเอียดอื่นๆ เช่น วันที่โพสต์
//                         );
//                       },
//                     ),
//                   );
//                 } else if (state is ThreadError) {
//                   return Text('เกิดข้อผิดพลาด: ${state.error}');
//                 }
//                 return Container();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
