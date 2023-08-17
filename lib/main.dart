import 'package:demo/views/assistive_touch.dart';
import 'package:demo/views/night.dart';
import 'package:demo/views/normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floatwing/flutter_floatwing.dart';

void main() {
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void floatwing() {
  runApp(((_) => const NonrmalView()).floatwing().make());
}

void floatwing2(Window w) {
  runApp(MaterialApp(
    // floatwing on widget can't use Window.of(context)
    // to access window instance
    // should use FloatwingPlugin().currentWindow
    home: const NonrmalView().floatwing(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _configs = [
    WindowConfig(
      id: "normal",
      // entry: "floatwing",
      route: "/normal",
      draggable: true,
    ),
    WindowConfig(
      id: "assitive_touch",
      // entry: "floatwing",
      route: "/assitive_touch",
      draggable: true,
    ),
    WindowConfig(
      id: "night",
      // entry: "floatwing",
      route: "/night",
      width: WindowSize.MatchParent, height: WindowSize.MatchParent,
      clickable: false,
    )
  ];

  final Map<String, WidgetBuilder> _builders = {
    "normal": (_) => const NonrmalView(),
    "assitive_touch": (_) => const AssistiveTouch(),
    "night": (_) => const NightView(),
  };

  final Map<String, Widget Function(BuildContext)> _routes = {};

  @override
  void initState() {
    super.initState();

    _routes["/"] = (_) => HomePage(configs: _configs);

    _configs.forEach((c) => {
      if (c.route != null && _builders[c.id] != null)
        {_routes[c.route!] = _builders[c.id]!.floatwing(debug: false)}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: _routes,
    );
  }
}

class HomePage extends StatefulWidget {
  final List<WindowConfig> configs;
  const HomePage({Key? key, required this.configs}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.configs.forEach((c) => _windows.add(c.to()));

    FloatwingPlugin().initialize();

    initAsyncState();
  }

  final List<Window> _windows = [];

  final Map<Window, bool> _readys = {};

  bool _ready = false;

  initAsyncState() async {
    var p1 = await FloatwingPlugin().checkPermission();
    var p2 = await FloatwingPlugin().isServiceRunning();

    // get permission first
    if (!p1) {
      FloatwingPlugin().openPermissionSetting();
      return;
    }

    // start service
    if (!p2) {
      FloatwingPlugin().startService();
    }

    _createWindows();

    setState(() {
      _ready = true;
    });
  }

  _createWindows() async {
    await FloatwingPlugin().isServiceRunning().then((v) async {
      if (!v) {
        await FloatwingPlugin().startService().then((_) {
          print("start the background service success.");
        });
      }
    });

    _windows.forEach((w) {
      var _w = FloatwingPlugin().windows[w.id];
      if (null != _w) {
        // replace w with _w
        _readys[w] = true;
        return;
      }
      w.on(EventType.WindowCreated, (window, data) {
        _readys[window] = true;
        setState(() {});
      }).create();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floatwing example app'),
      ),
      body: _ready
          ? ListView(
        children: _windows.map((e) => _item(e)).toList(),
      )
          : Center(
        child: ElevatedButton(
            onPressed: () {
              initAsyncState();
            },
            child: const Text("Start")),
      ),
    );
  }

  _debug(Window w) {
    Navigator.of(context).pushNamed(w.config!.route!);
  }

  Widget _item(Window w) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(w.id,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 213, 213),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Text(w.config?.toString() ?? ""),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (_readys[w] == true) ? () => w.start() : null,
                    child: const Text("Open"),
                  ),
                  TextButton(
                      onPressed:
                      w.config?.route != null ? () => _debug(w) : null,
                      child: const Text("Debug")),
                  TextButton(
                    onPressed: (_readys[w] == true)
                        ? () => {w.close(), w.share("close")}
                        : null,
                    child: const Text("Close", style: TextStyle(color: Colors.red)),
                  ),
                ],
              )
            ],
          )),
    );
  }
}