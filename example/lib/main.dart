import 'package:flutter/material.dart';
import 'package:flutter_pen_toolbar/flutter_pen_toolbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pen Toolbar Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _selectedPenIndex = 0;
  int _selectedColorIndex = 2;
  PenToolbarConfig _currentConfig = PenToolbarConfig.medium;

  final List<Color> _colors = const [
    Color(0xFF9C27B0),
    Color(0xFFE91E63),
    Color(0xFF2196F3),
    Color(0xFF4CAF50),
    Color(0xFFFFC107),
    Color(0xFF1A1A1A),
  ];

  final List<PenToolbarItem> _pens = [
    PenToolbarItem(type: PenType.pen, color: const Color(0xFF2196F3)),
    PenToolbarItem(type: PenType.pencil, color: const Color(0xFF4A4A4A)),
    PenToolbarItem(type: PenType.pencilTip, color: const Color(0xFF888888)),
    PenToolbarItem(type: PenType.ballpointPen, color: const Color(0xFF1a1a1a)),
    PenToolbarItem(type: PenType.gelPen, color: const Color(0xFF1E88E5)),
    PenToolbarItem(type: PenType.dashedPen, color: const Color(0xFF333333)),
    PenToolbarItem(type: PenType.highlighter, color: const Color(0xFFFFEB3B)),
    PenToolbarItem(type: PenType.brushPen, color: const Color(0xFFE53935)),
    PenToolbarItem(type: PenType.marker, color: const Color(0xFFFF9800)),
    PenToolbarItem(
        type: PenType.neonHighlighter, color: const Color(0xFF76FF03)),
    PenToolbarItem(type: PenType.fountainPen, color: const Color(0xFF3F51B5)),
    PenToolbarItem(type: PenType.fineliner, color: const Color(0xFF000000)),
    PenToolbarItem(type: PenType.crayon, color: const Color(0xFFFF5722)),
    PenToolbarItem(type: PenType.rulerPen, color: const Color(0xFF5D4037)),
  ];

  void _onColorSelected(int index) {
    setState(() {
      _selectedColorIndex = index;
      _pens[_selectedPenIndex] = _pens[_selectedPenIndex].copyWith(
        color: _colors[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Flutter Pen Toolbar'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Info card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected: ${_pens[_selectedPenIndex].displayName}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Index: $_selectedPenIndex',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // Size selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text('Size: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  _buildSizeButton('S', PenToolbarConfig.small),
                  _buildSizeButton('M', PenToolbarConfig.medium),
                  _buildSizeButton('L', PenToolbarConfig.large),
                ],
              ),
            ),

            const Spacer(),

            // Color picker
            _buildColorPicker(),

            const SizedBox(height: 16),

            // Pen toolbar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: PenToolbar(
                pens: _pens,
                initialSelectedIndex: _selectedPenIndex,
                config: _currentConfig,
                onPenSelected: (index) {
                  setState(() => _selectedPenIndex = index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String label, PenToolbarConfig config) {
    final isSelected = _currentConfig == config;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            setState(() => _currentConfig = config);
          }
        },
      ),
    );
  }

  Widget _buildColorPicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_colors.length, (index) {
          final isSelected = index == _selectedColorIndex;
          return GestureDetector(
            onTap: () => _onColorSelected(index),
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _colors[index],
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(color: Colors.white, width: 3)
                    : null,
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: _colors[index].withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: _colors[index].computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white,
                      size: 18,
                    )
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
