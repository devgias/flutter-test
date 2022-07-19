part of 'screens.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen(
      {Key? key,
      required this.title,
      required this.link,
      required this.isQuizable})
      : super(key: key);
  final String link;
  final String title;
  final bool isQuizable;

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController? _pdfViewController;
  bool loaded = false;
  String message = '';

  Future<File> getFileFromUrl(String url, {String? name}) async {
    String fileName = 'cs';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url)).timeout(
          const Duration(
            seconds: 15,
          ),
          onTimeout: () => throw Future.error('Timeout'));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void requestPermission() async {
    await Permission.storage.isGranted;
  }

  @override
  void initState() {
    requestPermission();
    getFileFromUrl(widget.link).then(
      (File? value) {
        if (mounted) {
          setState(
            () {
              if (value != null) {
                urlPDFPath = value.path;
                loaded = true;
                exists = true;
              } else {
                message = 'PDF not available';
                exists = false;
              }
            },
          );
        }
      },
    ).catchError((_) {
      if (mounted) {
        setState(() {
          message = 'Time out connection to server';
          exists = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return Scaffold(
        body: PDFView(
          filePath: urlPDFPath,
          autoSpacing: true,
          enableSwipe: true,
          pageSnap: true,
          swipeHorizontal: true,
          nightMode: false,
          onError: (e) {
            //Show some error message or UI
          },
          onRender: (int? _pages) {
            if (mounted) {
              setState(() {
                _totalPages = _pages!;
                pdfReady = true;
              });
            }
          },
          onViewCreated: (PDFViewController vc) {
            if (mounted) {
              setState(() {
                _pdfViewController = vc;
              });
            }
          },
          onPageChanged: (int? page, int? total) {
            if (mounted) {
              setState(() {
                _currentPage = page!;
              });
            }
          },
          onPageError: (page, e) {},
        ),
        floatingActionButton: Row(
          children: [
            widget.isQuizable
                ? Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ElevatedButton(
                      onPressed: () async {
                        final pref = await SharedPreferences.getInstance();
                        pref.setBool('modequiz', true);
                        Get.offAll(() => QuizScreen(
                              quiz: mockQuiz,
                              index: 0,
                            ));
                      },
                      child: Text(
                        'Quiz',
                        style: subtTitle.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_left_rounded),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                if (mounted) {
                  setState(() {
                    if (_currentPage > 0) {
                      _currentPage--;
                      _pdfViewController!.setPage(_currentPage);
                    }
                  });
                }
              },
            ),
            Text(
              "${_currentPage + 1}/$_totalPages",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_right_rounded),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                if (mounted) {
                  setState(() {
                    if (_currentPage < _totalPages - 1) {
                      _currentPage++;
                      _pdfViewController!.setPage(_currentPage);
                    }
                  });
                }
              },
            ),
          ],
        ),
      );
    } else {
      if (exists) {
        //Replace with your loading UI
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: const Center(child: CircularProgressIndicator()));
      } else {
        //Replace Error UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("PDF"),
          ),
          body: Center(
            child: Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    }
  }
}
