// import 'dart:io';
//
// import 'package:user/features/editor/presentation/video_editor_screen.dart';
// import 'package:user/features/home/presentation/video_preview_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<Map<String, String>> savedProjects = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedProjects();
//   }
//
//   Future<void> _loadSavedProjects() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> savedData = prefs.getStringList('saved_projects') ?? [];
//
//     setState(() {
//       savedProjects = savedData.map((entry){
//         List<String> split = entry.split('|');
//         return {
//           'video': split[0],
//           'thumbnail': split.length > 1 ? split[1] : '',
//         };
//       }).toList();
//     });
//   }
//
//   Future<void> _deleteProject(int index) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       File(savedProjects[index]['video']!).deleteSync();
//       File(savedProjects[index]['thumbnail']!).deleteSync();
//       savedProjects.removeAt(index);
//       prefs.setStringList('saved_projects', savedProjects.map((proj) => '${proj['video']}|${proj['thumbnail']}').toList());
//     });
//   }
//
//   void _showProjectNameDialog(){
//     TextEditingController _projectNameController = TextEditingController();
//
//     showDialog(context: context,
//         builder: (BuildContext context){
//           return AlertDialog(
//             title: Text("Name your project"),
//             content: TextField(
//               controller: _projectNameController,
//               decoration: InputDecoration(hintText: "Enter project name"),
//             ),
//             actions: [
//               TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel")),
//               TextButton(onPressed: (){
//                 String projectName = _projectNameController.text.trim();
//                 if(projectName.isNotEmpty){
//                   Navigator.pop(context);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context)=>VideoEditorScreen(projectName: projectName))
//                   ).then((_) => _loadSavedProjects());
//                 }
//               }, child: Text("Create")),
//             ],
//           );
//         }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Demo App'),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Container(
//           color: Colors.black,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 20,),
//               ElevatedButton(
//                 child: Text('Create new project', style: TextStyle(color: Colors.black),),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
//                 ),
//                 onPressed: _showProjectNameDialog,
//               ),
//               SizedBox(height: 30,),
//               savedProjects.isEmpty ?
//               Text(
//                 "Your projects will appear here",
//                 style: TextStyle(fontSize: 14, color: Colors.grey)
//               ) :
//                   Expanded(
//                       child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 12,
//                           mainAxisSpacing: 12,
//                           childAspectRatio: 1.0,
//                         ),
//                         padding: EdgeInsets.all(16),
//                         itemCount: savedProjects.length,
//                           itemBuilder: (context, index) {
//
//                             String filePath = savedProjects[index]['video']!;
//                             String projectName = filePath.split('/').last.replaceAll('.mp4', '');
//
//                             return GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => VideoPreviewScreen(videoPath: savedProjects[index]['video']!),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(16),
//                                   color: Colors.grey[900],
//                                 ),
//                                 child: Stack(
//                                   alignment: Alignment.bottomCenter,
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(16),
//                                       child: (savedProjects[index]['thumbnail'] != null)
//                                           ? Image.file(
//                                         File(savedProjects[index]['thumbnail']!),
//                                         width: double.infinity,
//                                         height: double.infinity,
//                                         fit: BoxFit.cover,
//                                       ) :
//                                       Icon(Icons.video_library, color: Colors.white, size: 80),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.all(8),
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: Colors.black.withOpacity(0.6),
//                                         borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
//                                       ),
//                                       child: Text(
//                                         projectName,
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 8,
//                                       right: 8,
//                                       child: IconButton(
//                                         icon: Icon(Icons.delete, color: Colors.red),
//                                         onPressed: () => _deleteProject(index),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                       )
//                   )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
