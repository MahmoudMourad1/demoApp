import 'dart:io';

import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/features/home/presentation/video_preview_screen.dart';
import 'package:user/generated/assets.dart';
import 'package:user/utils/extentions/extention.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_emoji/flutter_emoji.dart';


class EmojiSticker {
  String emoji;
  Offset position;
  double scale;
  double rotation;
  Color color;

  EmojiSticker({
    required this.emoji,
    this.position = Offset.zero,
    this.scale = 1.0,
    this.rotation = 0.0,
    this.color = Colors.white,
  });
}
class TextOverlay {
  String text;
  Offset position;
  Color color;
  double fontSize;
  String fontFamily;
  FontWeight fontWeight;
  TextAlign textAlign;
  Color backgroundColor;
  double backgroundOpacity;
  bool hasShadow;
  Color shadowColor;
  double shadowBlur;
  Offset shadowOffset;

  TextOverlay({
    required this.text,
    required this.position,
    this.color = Colors.white,
    this.fontSize = 24,
    this.fontFamily = 'Roboto',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.backgroundColor = Colors.transparent,
    this.backgroundOpacity = 0.5,
    this.hasShadow = true,
    this.shadowColor = Colors.black,
    this.shadowBlur = 2.0,
    this.shadowOffset = const Offset(2, 2),
  });
}
bool isShowCut=true;
class VideoEditorScreen extends StatefulWidget {
  final File videoFile; // Video file from camera or gallery

  final String projectName;
  VideoEditorScreen({required this.projectName,required this.videoFile});

  @override
  State<VideoEditorScreen> createState() => _VideoEditorScreenState();
}

class _VideoEditorScreenState extends State<VideoEditorScreen> {
  final ImagePicker _picker = ImagePicker();
  VideoEditorController? _videoEditorController;
  VideoPlayerController? _videoPlayerController;
  bool canShowEditor = false;
  List<Map<String, String>> trimmedVideos = [];
  bool isSeeking = false;
  bool enableTransition = false;
  bool isMuted = false;
  bool isSpeedControlVisible = false;
  double playbackSpeed = 1.0;
  String selectedAspectRatio = "Original";
  final Map<String, List<int>> aspectRatios = {
    "Original": [0, 0, 0, 0],
    "16:9": [1920, 1080, 0, 0],
    "9:16": [1080, 1920, 0, 0],
    "4:3": [1440, 1080, 0, 0],
  };
  @override
  void initState() {
    super.initState();
    _initializeVideoEditor(widget.videoFile);
  }

  // Initialize video editor and player
  Future<void> _initializeVideoEditor(File videoFile) async {
    _videoEditorController = VideoEditorController.file(
      videoFile,
      minDuration: const Duration(seconds: 1),
      maxDuration: const Duration(seconds: 53),
      trimStyle: TrimSliderStyle(
        // lineColor: Colors.red,
        // positionLineColor: Colors.red,

          onTrimmedColor: Color(0xFFFE2B54),
          // onTrimmingColor: Colors.blueAccent,
          iconColor: Colors.white
      ),
      coverStyle: CoverSelectionStyle(
        selectedBorderColor: Colors.red,

      ),
      // cropStyle: CropGridStyle(
      //   boundariesColor: Colors.red,
      //   background: Colors.red,
      //   croppingBackground: Colors.red,
      //   gridLineColor: Colors.red,
      //   selectedBoundariesColor: Colors.red,
      //
      // )
    );

    _videoPlayerController = VideoPlayerController.file(videoFile);

    try {
      await Future.wait([
        _videoEditorController!.initialize(),
        _videoPlayerController!.initialize(),
      ]);

      _videoPlayerController!.addListener(() {
        if (_videoPlayerController!.value.position >= _videoEditorController!.endTrim) {
          _videoPlayerController!.pause();
        }
      });

      setState(() {
        canShowEditor = true;
      });
    } catch (e) {
      print("Initialization error: $e");
    }
  }
  String selectFilter = "None";
  final Map<String, String> filterImages = {
    "None":Assets.filteredImagesOriginalPhoto,
    "Brightness": Assets.filteredImagesBrightnessFiltered,
    "Contrast": Assets.filteredImagesContrastFiltered,
    "Saturation": Assets.filteredImagesSaturationFiltered,
    "Grayscale": Assets.filteredImagesGrayscaleFiltered,
    "Sepia": Assets.filteredImagesSepiaFiltered,
    "Invert": Assets.filteredImagesInvertFiltered,
    "Warm": Assets.filteredImagesWarmFiltered,
    "Cool": Assets.filteredImagesCoolFiltered,
    "Sharpen": Assets.filteredImagesSharpenFiltered,
    "Blur": Assets.filteredImagesBlurFiltered,
    "Night Mode": Assets.filteredImagesNightModeFiltered,
      "Soft Glow": Assets.filteredImagesSoftGlowFiltered,
    "Black & White High Contrast": Assets.filteredImagesBlackWhiteHighContrastFiltered,
  };
  final Map<String, String> filterCommands = {
    "None": "",
    "Brightness": "eq=brightness=0.3",
    "Contrast": "eq=contrast=1.5",
    "Saturation": "eq=saturation=1.8",
    "Grayscale": "format=gray",
    "Sepia": "colorchannelmixer=.393:.769:.189:0:.349:.686:.168:0:.272:.534:.131",
    "Invert": "negate=1",
    "Warm": "eq=gamma_r=1.2:gamma_g=1.1:gamma_b=0.9",
    "Cool": "eq=gamma_r=0.9:gamma_g=1.1:gamma_b=1.2",
    "Sharpen": "unsharp=5:5:0.8:5:5:0.8",
    "Blur": "gblur=sigma=5",
    "Vintage": "curves=vintage",
    "Cinematic": "colorbalance=rs=0.3:gs=0.2:bs=-0.3",
    "Night Mode": "eq=brightness=-0.2:saturation=0.5",
    "Soft Glow": "gblur=sigma=3,eq=brightness=0.2",
    "Black & White High Contrast": "format=gray,eq=contrast=2",
  };
  ColorFilter getColorFilterFromName(String filterName) {
    switch (filterName) {
      case "Brightness":
        return ColorFilter.matrix([
          1.3, 0,   0,   0, 0,
          0,   1.3, 0,   0, 0,
          0,   0,   1.3, 0, 0,
          0,   0,   0,   1, 0,
        ]);

      case "Contrast":
        return ColorFilter.matrix([
          1.5, 0,   0,   0, -0.25,
          0,   1.5, 0,   0, -0.25,
          0,   0,   1.5, 0, -0.25,
          0,   0,   0,   1, 0,
        ]);

      case "Saturation":
        return ColorFilter.matrix([
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0,      0,      0,      1, 0,
        ]);

      case "Grayscale":
        return ColorFilter.matrix([
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0,      0,      0,      1, 0,
        ]);

      case "Sepia":
        return ColorFilter.matrix([
          0.393, 0.769, 0.189, 0, 0,
          0.349, 0.686, 0.168, 0, 0,
          0.272, 0.534, 0.131, 0, 0,
          0,     0,     0,     1, 0,
        ]);

      case "Invert":
        return ColorFilter.matrix([
          -1,  0,  0, 0, 255,
          0, -1,  0, 0, 255,
          0,  0, -1, 0, 255,
          0,  0,  0, 1,   0,
        ]);

      case "Warm":
        return ColorFilter.matrix([
          1.2, 0,   0,   0, 0,
          0,   1.1, 0,   0, 0,
          0,   0,   0.9, 0, 0,
          0,   0,   0,   1, 0,
        ]);

      case "Cool":
        return ColorFilter.matrix([
          0.9, 0,   0,   0, 0,
          0,   1.1, 0,   0, 0,
          0,   0,   1.2, 0, 0,
          0,   0,   0,   1, 0,
        ]);

      case "Night Mode":
        return ColorFilter.matrix([
          0.8, 0,   0,   0, 0,
          0,   0.8, 0,   0, 0,
          0,   0,   0.8, 0, 0,
          0,   0,   0,   1, 0,
        ]);

      case "Black & White High Contrast":
        return ColorFilter.matrix([
          1.5, 0,   0,   0, -0.5,
          0,   1.5, 0,   0, -0.5,
          0,   0,   1.5, 0, -0.5,
          0,   0,   0,   1, 0,
        ]);

      case "None":
      default:
        return ColorFilter.matrix([
          1, 0, 0, 0, 0,
          0, 1, 0, 0, 0,
          0, 0, 1, 0, 0,
          0, 0, 0, 1, 0,
        ]);
    }
  }
  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 400,
          child: Column(
            children: [
              Text(
                "Select Filter",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filterImages.length,
                  itemBuilder: (context, index) {
                    String filterName = filterImages.keys.elementAt(index);
                    String imagePath = filterImages[filterName]!;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectFilter = filterName;
                        });
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: selectFilter == filterName
                                      ? Colors.green
                                      : Colors.white10,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            filterName,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  
  void _openCropRatioModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            color: Colors.black,
            padding: EdgeInsets.all(16),
            height: 200,
            child: Column(
              children: [
                Text("Select crop ratio",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: aspectRatios.keys.map((ratio){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedAspectRatio = ratio;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: selectedAspectRatio == ratio ? Colors.green : Colors.white10,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(ratio,style: TextStyle(color: Colors.white),),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        }
    );
  }

  Future<void> _pickVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file != null) {
      _videoEditorController = VideoEditorController.file(
        File(file.path),
        minDuration: const Duration(seconds: 1),
        maxDuration: const Duration(seconds: 53),
      );

      _videoPlayerController = VideoPlayerController.file(File(file.path));

      try {
        await Future.wait([
          _videoEditorController!.initialize(),
          _videoPlayerController!.initialize(),
        ]);

        _videoPlayerController!.addListener(() {
          if (_videoPlayerController!.value.position >= _videoEditorController!.endTrim) {
            _videoPlayerController!.pause();
          }
        });

        setState(() {
          canShowEditor = true;
        });
      } catch (e) {
        print("Initialization error: $e");
      }
    }
  }
  List<TextOverlay> textOverlays = [];
  bool isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
  // final EmojiParser _emojiParser = EmojiParser();
  List<EmojiSticker> _emojiStickers = [];
  EmojiSticker? _selectedEmoji;
  double _initialScale = 1.0;
  Offset _initialPosition = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Future<void> _trimVideo() async {
    if(_videoEditorController == null) return;
    final start = _videoEditorController!.startTrim.inMilliseconds/1000;
    final end = _videoEditorController!.endTrim.inMilliseconds/1000;
    final Directory tempDir = await getTemporaryDirectory();
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String fileName = 'trimmed_video_$timestamp.mp4';
    final String outputPath = path.join(tempDir.path, fileName);
    print("tempDir : $outputPath");

    final String command = '-i ${_videoEditorController!.file.path} -ss $start -to $end -c copy $outputPath';
    await FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();
      if(ReturnCode.isSuccess(returnCode)) {
        _generateThumbnail(outputPath, timestamp);
      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to export video')),
        );
      }
    });
  }


  Future<void> _generateThumbnail(String videoPath, String timestamp) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String fileName = 'thumb_$timestamp.jpg';
    final String thumbnailPath = path.join(tempDir.path, fileName);

    final String command = '-i $videoPath -ss 00:00:00.500 -vframes 1 $thumbnailPath';

    await FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();
      if(ReturnCode.isSuccess(returnCode)) {
        setState(() {
          trimmedVideos.add({
            'video': videoPath,
            'thumbnail': thumbnailPath
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to export video')),
        );
      }
    });
  }



  String selectedFrame = "";

  Future<void> _mergeVideos() async {
    if (trimmedVideos.isEmpty) return;

    final Directory tempDir = await getTemporaryDirectory();
    final String mergedVideoPath = '${tempDir.path}/${widget.projectName}.mp4';
    final String fileListPath = '${tempDir.path}/file_list.txt';
    File fileList = File(fileListPath);

    // Write file list for FFmpeg
    String fileListContent = trimmedVideos.map((path) => "file '${path['video']}'").join("\n");
    await fileList.writeAsString(fileListContent);

    // Add text overlays


    // Base FFmpeg command
    String command = '-f concat -safe 0 -i $fileListPath';

    List<String> videoFilters = [];
    List<String> audioFilters = [];
    for (var overlay in textOverlays) {
      String text = overlay.text;
      Offset position = overlay.position;

      // Escape text for FFmpeg
      String escapedText = text.replaceAll("'", "\\'");

      // Clamp position to stay within video bounds
      double safeX = position.dx.clamp(0, _videoPlayerController!.value.size.width - 50);
      double safeY = position.dy.clamp(0, _videoPlayerController!.value.size.height - 50);

      // Add drawtext filter
      videoFilters.add(
          "drawtext=text='$escapedText':x=$safeX:y=$safeY:"
              "fontsize=24:fontcolor=black:"
              "fontfile=/system/fonts/DroidSans.ttf"
      );
    }
    bool hasFrame = selectedFrame.isNotEmpty;

    // Overlay frame if selected
    if (hasFrame) {
      String framePath = await saveFrameToTemp(selectedFrame);
      command += ' -i $framePath'; // Add frame as input
      videoFilters.add('[0:v][1:v] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [overlayed]');
    } else {
      videoFilters.add("[0:v] null [overlayed]");
    }

    // Apply selected filter
    if (selectFilter != "None") {
      videoFilters.add("[overlayed] ${filterCommands[selectFilter]} [filtered]");
    } else {
      videoFilters.add("[overlayed] null [filtered]");
    }

    // Apply transition (fade-in)
    if (enableTransition) {
      videoFilters.add("[filtered] fade=in:0:30 [transitioned]");
    } else {
      videoFilters.add("[filtered] null [transitioned]");
    }

    // Adjust aspect ratio
    if (selectedAspectRatio != "Original") {
      final videoWidth = _videoPlayerController!.value.size.width;
      final videoHeight = _videoPlayerController!.value.size.height;

      final aspectRatioSettings = aspectRatios[selectedAspectRatio]!;
      int targetWidth = aspectRatioSettings[0];
      int targetHeight = aspectRatioSettings[1];

      double videoAspectRatio = videoWidth / videoHeight;
      double targetAspectRatio = targetWidth / targetHeight.toDouble();

      int cropX = 0, cropY = 0;

      if (videoAspectRatio > targetAspectRatio) {
        targetWidth = (videoHeight * targetAspectRatio).toInt();
        cropX = ((videoWidth - targetWidth) ~/ 2);
        targetHeight = videoHeight.toInt();
      } else {
        targetHeight = (videoWidth / targetAspectRatio).toInt();
        cropY = ((videoHeight - targetHeight) ~/ 2);
        targetWidth = videoWidth.toInt();
      }

      targetWidth = targetWidth - (targetWidth % 2);
      targetHeight = targetHeight - (targetHeight % 2);

      videoFilters.add("[transitioned] crop=$targetWidth:$targetHeight:$cropX:$cropY [cropped]");
    } else {
      videoFilters.add("[transitioned] null [cropped]");
    }

    // Adjust playback speed
    if (playbackSpeed != 1.0) {
      double setptsValue = 1 / playbackSpeed;
      videoFilters.add("[cropped] setpts=$setptsValue*PTS [spedup]");
      if (!isMuted) {
        audioFilters.add("atempo=$playbackSpeed");
      }
    } else {
      videoFilters.add("[cropped] null [spedup]");
    }

    // Add filter_complex if needed
    if (videoFilters.isNotEmpty) {
      command += ' -filter_complex "${videoFilters.join(";")}" -map "[spedup]"';
    } else {
      command += ' -map 0:v';
    }

    // Apply audio filters
    if (audioFilters.isNotEmpty) {
      command += ' -af "${audioFilters.join(";")}"';
    }

    // Mute if needed
    if (isMuted) {
      command += ' -an';
    }

    // Encoding settings
    command += ' -c:v libx264 -preset medium -crf 23 -movflags +faststart $mergedVideoPath -y';

    // Execute FFmpeg command
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        String thumbnailPath = trimmedVideos.first['thumbnail']!;
        List<String> savedProjects = prefs.getStringList('saved_projects') ?? [];
        savedProjects.add('$mergedVideoPath|$thumbnailPath');
        prefs.setStringList('saved_projects', savedProjects);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ Final video exported to: $mergedVideoPath")),
        );
        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPreviewScreen(videoPath: mergedVideoPath),
                    ),
                  );
      } else {
        print("❌ FFmpeg Merge Error: ${await session.getOutput()}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to merge videos. Check logs.")),
        );
      }
    });
  }



  Future<String> saveFrameToTemp(String frameAssetPath) async {
    final ByteData data = await rootBundle.load(frameAssetPath);
    final Uint8List bytes = data.buffer.asUint8List();

    final Directory tempDir = await getTemporaryDirectory();
    final File tempFile = File('${tempDir.path}/frame.png');

    await tempFile.writeAsBytes(bytes);
    return tempFile.path;
  }
  void showTextDialog(BuildContext context, {TextOverlay? existingOverlay, int? index}) {
    final textController = TextEditingController(text: existingOverlay?.text ?? '');
    Color currentColor = existingOverlay?.color ?? Colors.white;
    double currentFontSize = existingOverlay?.fontSize ?? 24;
    String currentFontFamily = existingOverlay?.fontFamily ?? 'Roboto';
    FontWeight currentFontWeight = existingOverlay?.fontWeight ?? FontWeight.normal;
    Color currentBgColor = existingOverlay?.backgroundColor ?? Colors.transparent;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: Text('Add Text', style: TextStyle(color: Colors.white)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: textController,
                      style: TextStyle(color: currentColor),
                      decoration: InputDecoration(
                        hintText: 'Enter your text',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Font Size Slider
                    Row(
                      children: [
                        Text('Size:', style: TextStyle(color: Colors.white)),
                        Expanded(
                          child: Slider(
                            value: currentFontSize,
                            min: 12,
                            max: 72,
                            onChanged: (value) => setState(() => currentFontSize = value),
                          ),
                        ),
                      ],
                    ),

                    // Color Picker
                    Row(
                      children: [
                        Text('Color:', style: TextStyle(color: Colors.white)),
                        ...['White', 'Red', 'Yellow', 'Green', 'Blue'].map((color) {
                          final colorValue = _getColorFromString(color);
                          return IconButton(
                            icon: Icon(Icons.circle, color: colorValue),
                            onPressed: () => setState(() => currentColor = colorValue),
                          );
                        }).toList(),
                      ],
                    ),

                    // Font Family Selector
                    DropdownButton<String>(
                      value: currentFontFamily,
                      items: ['Roboto', 'Arial', 'Courier', 'DancingScript', 'Lobster']
                          .map((font) => DropdownMenuItem(
                        value: font,
                        child: Text(font, style: TextStyle(
                          color: Colors.white,
                          fontFamily: font,
                        )),
                      ))
                          .toList(),
                      onChanged: (value) => setState(() => currentFontFamily = value!),
                      dropdownColor: Colors.grey[900],
                    ),

                    // Background Toggle
                    SwitchListTile(
                      title: Text('Background', style: TextStyle(color: Colors.white)),
                      value: currentBgColor != Colors.transparent,
                      onChanged: (value) => setState(() => currentBgColor = value ? Colors.black : Colors.transparent),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    final newOverlay = TextOverlay(
                      text: textController.text,
                      position: existingOverlay?.position ?? Offset(100, 100),
                      color: currentColor,
                      fontSize: currentFontSize,
                      fontFamily: currentFontFamily,
                      fontWeight: currentFontWeight,
                      backgroundColor: currentBgColor,
                    );

                    if (index != null) {
                      textOverlays[index] = newOverlay;
                    } else {
                      textOverlays.add(newOverlay);
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Color _getColorFromString(String color) {
    switch (color.toLowerCase()) {
      case 'red': return Colors.red;
      case 'yellow': return Colors.yellow;
      case 'green': return Colors.green;
      case 'blue': return Colors.blue;
      default: return Colors.white;
    }
  }
  void _showFrameSelectionSheet() {
    List<String> frameAssets = [
      Assets.framesFrame2,
      Assets.framesFrame3
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      builder: (context) {

        return Container(
          padding: EdgeInsets.all(16),
          height: 200,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: frameAssets.length,
            itemBuilder: (context, index) {
              bool isSelected = frameAssets[index] == selectedFrame;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFrame = frameAssets[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: isSelected ? Border.all(color: Colors.blue, width: 4) : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(frameAssets[index], fit: BoxFit.cover),
                      if (isSelected)
                        Icon(Icons.check_circle, color: Colors.blue, size: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Video Edit',style: AppTextStyle.font18black600.copyWith(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,

          actions: [
            SizedBox(
                width: 70.w,
                child: GestureDetector(
                  onTap: _mergeVideos,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFFFE2B54),borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text('Done',style: AppTextStyle.font14black500.copyWith(color: Colors.white),),
                    ),
                  ),
                )).withVerticalPadding(10).withHorizontalPadding(5)
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       enableTransition = !enableTransition;
            //     });
            //   },
            //   icon: Icon(enableTransition ? Icons.swap_horizontal_circle : Icons.swap_horizontal_circle_outlined),
            // ),
          ],
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
              // Video preview area
      if (canShowEditor && _videoPlayerController!.value.isInitialized && _videoEditorController!.initialized) ...[
      // Video preview area
      Expanded(
      flex: 4,
      child: ColorFiltered(
        colorFilter: getColorFilterFromName(selectFilter),

        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
            ),
            // if (true)...[
            //
            //     Positioned.fill(
            //       child: ColorFiltered(
            //         colorFilter: getColorFilterFromName(selectedFilter),
            //         child: Container(
            //           color: Colors.black.withOpacity(0.01), // Small opacity to ensure filter applies
            //         ),
            //       ),
            //     ),
            // ],
            // // Show frame overlay
            if (selectedFrame.isNotEmpty)
              Positioned.fill(
                child: Image.asset(
                  selectedFrame,
                  fit: BoxFit.cover,
                ),
              ),
            // Add text overlays
            // ...textOverlays.map((overlay) {
            //   return Positioned(
            //     left: overlay['position'].dx,
            //     top: overlay['position'].dy,
            //     child: GestureDetector(
            //       onPanUpdate: (details) {
            //         setState(() {
            //           overlay['position'] += details.delta;
            //         });
            //       },
            //       child: Container(
            //         padding: EdgeInsets.all(8),
            //         color: Colors.black.withOpacity(0.5),
            //         child: Text(
            //           overlay['text'],
            //           style: TextStyle(color: Colors.white, fontSize: 20),
            //         ),
            //       ),
            //     ),
            //   );
            // }).toList(),
            ...textOverlays.map((TextOverlay overlay) {
              return Positioned(
                left: overlay.position.dx,
                top: overlay.position.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      overlay.position += details.delta;
                    });
                  },
                  onTap: () => showTextDialog(context,
                      existingOverlay: overlay,
                      index: textOverlays.indexOf(overlay)),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: overlay.backgroundColor.withOpacity(overlay.backgroundOpacity),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      overlay.text,
                      style: TextStyle(
                        color: overlay.color,
                        fontSize: overlay.fontSize,
                        fontFamily: overlay.fontFamily,
                        fontWeight: overlay.fontWeight,
                        shadows: overlay.hasShadow ? [
                          Shadow(
                            color: overlay.shadowColor,
                            blurRadius: overlay.shadowBlur,
                            offset: overlay.shadowOffset,
                          ),
                        ] : null,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            ..._emojiStickers.map((overlay) {
              return Positioned(
                left: overlay.position.dx,
                top: overlay.position.dy,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedEmoji = overlay;
                    });
                  },
                  onScaleStart: (details) {
                    setState(() {
                      _initialScale = overlay.scale;
                      _initialPosition = overlay.position;
                      _initialFocalPoint = details.focalPoint;
                    });
                  },
                  onScaleUpdate: (details) {
                    setState(() {
                      // Handle scaling
                      overlay.scale = _initialScale * details.scale;

                      // Handle translation (panning)
                      final offsetDelta = (details.focalPoint - _initialFocalPoint);
                      overlay.position = _initialPosition + offsetDelta;
                    });
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Edit Emoji"),
                        actions: [
                          TextButton(
                            child: Text("Delete"),
                            onPressed: () {
                              setState(() {
                                _emojiStickers.remove(overlay);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Transform.scale(
                    scale: overlay.scale,
                    child: Container(
                      decoration: _selectedEmoji == overlay
                          ? BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(4),
                      )
                          : null,
                      child: Text(
                        overlay.emoji,
                        style: TextStyle(
                          fontSize:  overlay.scale<8?100: overlay.scale,
                          color: overlay.color,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),

          ],
             ),
      ),
    ),
              // Expanded(
              //   flex: 4,
              //   child: Column(
              //     children: [
              //       Expanded(
              //         child: Stack(
              //           alignment: Alignment.center,
              //           children: [
              //             AspectRatio(
              //                 aspectRatio: _videoPlayerController!.value.aspectRatio,
              //                 child: VideoPlayer(_videoPlayerController!)
              //             ),
              //             IconButton(
              //                 onPressed: (){
              //                   setState(() {
              //                     if(_videoPlayerController!.value.isPlaying){
              //                       _videoPlayerController!.pause();
              //                     } else {
              //                       if(!isSeeking){
              //                         int startTrimDuration = _videoEditorController!.startTrim.inSeconds;
              //                         _videoPlayerController!.seekTo(Duration(seconds: startTrimDuration));
              //                       }
              //                       _videoPlayerController!.play();
              //                     }
              //                   });
              //                 },
              //                 icon: Icon(
              //                   _videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
              //                   color: Colors.white,
              //                   size: 48,
              //                 )
              //             )
              //           ],
              //         ),
              //       ),
              //       Slider(
              //         value: _videoPlayerController!.value.position.inMilliseconds.toDouble(),
              //         max: _videoPlayerController!.value.duration.inMilliseconds.toDouble(),
              //         onChangeStart: (value){
              //           isSeeking = true;
              //         },
              //         onChanged: (value){
              //           _videoPlayerController!.seekTo(Duration(milliseconds: value.toInt()));
              //           setState(() {});
              //         },
              //         onChangeEnd: (value){
              //           isSeeking = false;
              //           _videoPlayerController!.play();
              //         },
              //       ),
              //       if(isSpeedControlVisible)
              //         Padding(
              //             padding: EdgeInsets.all(8),
              //           child: Column(
              //             children: [
              //               Text("Speed : ${playbackSpeed.toStringAsFixed(1)}x", style: TextStyle(color: Colors.white),),
              //               Slider(
              //                 min: 0.5,
              //                   max: 3.0,
              //                   divisions: 6,
              //                   value: playbackSpeed,
              //                   onChanged: (value){
              //                     setState(() {
              //                       playbackSpeed = value;
              //                       _videoPlayerController!.setPlaybackSpeed(playbackSpeed);
              //                     });
              //                   }
              //               )
              //             ],
              //           ),
              //         ),
              //     ],
              //   ),
              // ),
              // Timeline editor

              Expanded(
                flex: 1,
                  child: ReorderableListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trimmedVideos.length,
                    onReorder: (int oldIndex, int newIndex) {
                      if(newIndex > oldIndex) newIndex -= 1;
                      final Map<String,String> movedClip = trimmedVideos.removeAt(oldIndex);
                      trimmedVideos.insert(newIndex, movedClip);
                    },
                    itemBuilder: (context, index){
                      return ReorderableDragStartListener(
                        index: index,
                        key: ValueKey(trimmedVideos[index]['video']),
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              trimmedVideos[index]['thumbnail'] != null ?
                                  Image.file(File(trimmedVideos[index]['thumbnail']!), fit: BoxFit.cover, width: double.infinity,) :
                                  Center(child: CircularProgressIndicator(),),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red,),
                                  onPressed: () => setState(() {
                                    trimmedVideos.removeAt(index);
                                  }),
                                )
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
              ),

              // TrimSlider
              TrimSlider(
                  controller: _videoEditorController!,
                height: 60,
                horizontalMargin: 16,
                child: TrimTimeline(
                  controller: _videoEditorController!,
                ),
              ),

              // // Editing toolbar
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(onPressed: _trimVideo, icon: Icon(Icons.content_cut, color: Colors.white,)),
              //       IconButton(onPressed: () => _openCropRatioModal(context), icon: Icon(Icons.crop, color: Colors.white,)),
              //       IconButton(onPressed: (){
              //         setState(() {
              //           isSpeedControlVisible = !isSpeedControlVisible;
              //         });
              //       }, icon: Icon(Icons.speed, color: !isSpeedControlVisible ? Colors.white : Colors.green,)),
              //       IconButton(onPressed: (){
              //         setState(() {
              //           isMuted = !isMuted;
              //           _videoPlayerController!.setVolume(isMuted ? 0 : 1);
              //         });
              //       }, icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white,)),
              //       IconButton(onPressed: ()=>_showFilterModal(context), icon: Icon(Icons.filter, color: Colors.white,)),
              //       IconButton(onPressed: ()=>_showFrameSelectionSheet(), icon: Icon(Icons.filter_frames_outlined, color: Colors.white,)),
              //     ],
              //   ),
              // ),

        isKeyboardOpen(context)?SizedBox():   Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _editWidget(title: 'Text',imagePath: Assets.svgTexticon,  ontap: () {
                  showTextDialog(context);


                },),
                _editWidget(title: 'Canvas',imagePath: Assets.svgCanvasicon,ontap: _trimVideo),
                _editWidget(title: 'BG',imagePath: Assets.svgBgicon,ontap: (){
                  _showEmojiSheet(context);
                }),
                _editWidget(title: 'Trim',imagePath: Assets.svgTrimicon,ontap: _trimVideo),

                _editWidget(title: 'Split',imagePath: Assets.svgSpliticon,ontap: _trimVideo),
                _editWidget(title: 'Crop',imagePath: Assets.svgCropicon,ontap: (){
                  _openCropRatioModal(context);
                }),
                _editWidget(title: 'Speed',imagePath: Assets.svgSpeedicon,ontap: _trimVideo),
                _editWidget(title: 'Filter',imagePath: Assets.svgFiltersicon,ontap: (){
                  _showFilterModal(context);
                }),
                _editWidget(title: 'Frames',imagePath: Assets.svgFiltersicon,ontap: (){
                  _showFrameSelectionSheet();
                }),
                _editWidget(title: 'Delete',imagePath: Assets.svgDeleteicon,ontap: _trimVideo),
                _editWidget(title: 'Transition',imagePath: Assets.svgTransaction,ontap: _trimVideo),

                _editWidget(title: 'Volume',imagePath:isMuted?Assets.svgVolumeoff: Assets.svgVolume,isWhite: true,ontap: () {
                  setState(() {
                    isMuted = !isMuted;
                    _videoPlayerController!.setVolume(isMuted ? 0 : 1);
                  });
                },),
                _editWidget(title: 'Adjust',imagePath: Assets.svgAdjust,ontap: _trimVideo),
                _editWidget(title: 'Replace',imagePath: Assets.svgReplace,ontap: _trimVideo),
                _editWidget(title: 'Duplicate',imagePath: Assets.svgDublicate,ontap: _trimVideo),

                // IconButton(
                //   onPressed: () => _openCropRatioModal(context),
                //   icon: Icon(Icons.crop, color: Colors.white),
                // ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSpeedControlVisible = !isSpeedControlVisible;
                    });
                  },
                  icon: Icon(Icons.speed, color: !isSpeedControlVisible ? Colors.white : Colors.green),
                ),
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       isMuted = !isMuted;
                //       _videoPlayerController!.setVolume(isMuted ? 0 : 1);
                //     });
                //   },
                //   icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white),
                // ),
                IconButton(
                  onPressed: () => _showFilterModal(context),
                  icon: Icon(Icons.filter, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
              // Bottom Action buttons
              // Padding(
              //   padding: EdgeInsets.all(16),
              //   child: ElevatedButton(
              //     onPressed: _mergeVideos,
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.green,
              //     ),
              //     child: Text(
              //       'Merge & Export Final video',
              //       style: TextStyle(fontSize: 16),
              //     ),
              //   ),
              // )
            ]
            else...[
              Expanded(
                  child: Center(
                    child: Text(
                      'Select a video to start editing',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  onPressed: _pickVideo,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                  ),
                  child: Text(
                    'Import video',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              )
            ]
          ],
        ),
      )
    );
  }
  Widget _editWidget({required GestureTapCallback ontap,required String title,required String imagePath,bool isWhite=false}){
    return  GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          // IconButton(
          //   onPressed: _trimVideo,
          //   icon: Icon(Icons.content_cut, color: Colors.white),
          // ),
          AppImageView(svgPath: imagePath,fit: BoxFit.contain,height: 20.h,width: 30.w,color: isWhite?Colors.white:null,),
          Spacer(),
          Text(title,style: AppTextStyle.font12black2400.copyWith(color:(isWhite&&imagePath!=Assets.svgVolumeoff&&imagePath!=Assets.svgVolume)?Colors.white: Color(0xFFA9A9A9)),)
        ],
      ),
    ).withHorizontalPadding(14);
  }

  void _showEmojiSheet(BuildContext context) {
    // Using a predefined list of popular emoji shortcodes
    final emojiCategories = {
      'Smileys': ['😀', '😃', '😄', '😁', '😆', '😅', '😂', '🤣', '😊', '😇'],
      'Animals': ['🐶', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻', '🐼', '🦁', '🐮'],
      'Food': ['🍎', '🍐', '🍊', '🍋', '🍌', '🍉', '🍇', '🍓', '🍒', '🍑'],
      'Activities': ['⚽', '🏀', '🏈', '⚾', '🎾', '🏐', '🏉', '🎱', '🏓', '🏸'],
      'Objects': ['⌚', '📱', '💻', '⌨️', '🖥️', '🖨️', '🖱️', '🖲️', '🕹️', '🗜️'],
    };

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

          ),    child: DefaultTabController(
          length: emojiCategories.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: Color(0xFFFE2B54),
                unselectedLabelColor: Colors.white,
                tabs: emojiCategories.keys.map((category) => Tab(text: category)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: emojiCategories.values.map((emojis) {
                    return GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: emojis.length,
                      itemBuilder: (context, index) {
                        final emoji = emojis[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _emojiStickers.add(EmojiSticker(
                                emoji: emoji,
                                position: Offset(
                                  MediaQuery.of(context).size.width / 2,
                                  MediaQuery.of(context).size.height / 2,
                                ),
                              ));
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                emoji,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),);
      },
    );
  }
}
