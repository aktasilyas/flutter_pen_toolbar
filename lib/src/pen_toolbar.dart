import 'package:flutter/material.dart';

/// Kalem tipleri
enum PenType {
  pen,
  pencil,
  pencilTip,
  ballpointPen,
  gelPen,
  dashedPen,
  highlighter,
  brushPen,
  marker,
  neonHighlighter,
  fountainPen,
  fineliner,
  crayon,
  rulerPen,
}

/// Toolbar boyut ve stil konfigürasyonu
class PenToolbarConfig {
  /// Kalem boyutları
  final double penWidth;
  final double penHeight;

  /// Toolbar boyutları
  final double toolbarHeight;
  final double toolbarBorderRadius;
  final double itemSpacing;
  final EdgeInsets padding;

  /// Gövde ayarları
  final double bodyWidthRatio;
  final double tipHeightRatio;
  final double stripeHeight;
  final double stripeTopOffset;

  /// Renkler
  final Color bodyColor;
  final Color bodyColorDark;
  final Color bodyColorLight;
  final Color bodyStrokeColor;
  final Color toolbarBackgroundColor;

  /// Animasyon
  final Duration animationDuration;
  final Curve animationCurve;
  final double selectedOffset;
  final double unselectedOffset;

  /// Gölge
  final List<BoxShadow>? toolbarShadow;

  const PenToolbarConfig({
    this.penWidth = 26,
    this.penHeight = 56,
    this.toolbarHeight = 68,
    this.toolbarBorderRadius = 14,
    this.itemSpacing = 4,
    this.padding = const EdgeInsets.only(left: 10, right: 10, top: 8),
    this.bodyWidthRatio = 0.55,
    this.tipHeightRatio = 0.28,
    this.stripeHeight = 3,
    this.stripeTopOffset = 8,
    this.bodyColor = const Color(0xFFF5F3F0),
    this.bodyColorDark = const Color(0xFFE8E6E3),
    this.bodyColorLight = const Color(0xFFFFFEFC),
    this.bodyStrokeColor = const Color(0xFFDDDBD8),
    this.toolbarBackgroundColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 180),
    this.animationCurve = Curves.easeOutCubic,
    this.selectedOffset = 0,
    this.unselectedOffset = -12,
    this.toolbarShadow,
  });

  /// Varsayılan gölge
  List<BoxShadow> get defaultShadow =>
      toolbarShadow ??
      [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 12,
          offset: const Offset(0, 2),
        ),
      ];

  /// Ölçeklenmiş kopya oluştur
  PenToolbarConfig scale(double factor) {
    return PenToolbarConfig(
      penWidth: penWidth * factor,
      penHeight: penHeight * factor,
      toolbarHeight: toolbarHeight * factor,
      toolbarBorderRadius: toolbarBorderRadius * factor,
      itemSpacing: itemSpacing * factor,
      padding: padding * factor,
      bodyWidthRatio: bodyWidthRatio,
      tipHeightRatio: tipHeightRatio,
      stripeHeight: stripeHeight * factor,
      stripeTopOffset: stripeTopOffset * factor,
      bodyColor: bodyColor,
      bodyColorDark: bodyColorDark,
      bodyColorLight: bodyColorLight,
      bodyStrokeColor: bodyStrokeColor,
      toolbarBackgroundColor: toolbarBackgroundColor,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      selectedOffset: selectedOffset * factor,
      unselectedOffset: unselectedOffset * factor,
      toolbarShadow: toolbarShadow,
    );
  }

  /// Özel değerlerle kopya oluştur
  PenToolbarConfig copyWith({
    double? penWidth,
    double? penHeight,
    double? toolbarHeight,
    double? toolbarBorderRadius,
    double? itemSpacing,
    EdgeInsets? padding,
    double? bodyWidthRatio,
    double? tipHeightRatio,
    double? stripeHeight,
    double? stripeTopOffset,
    Color? bodyColor,
    Color? bodyColorDark,
    Color? bodyColorLight,
    Color? bodyStrokeColor,
    Color? toolbarBackgroundColor,
    Duration? animationDuration,
    Curve? animationCurve,
    double? selectedOffset,
    double? unselectedOffset,
    List<BoxShadow>? toolbarShadow,
  }) {
    return PenToolbarConfig(
      penWidth: penWidth ?? this.penWidth,
      penHeight: penHeight ?? this.penHeight,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      toolbarBorderRadius: toolbarBorderRadius ?? this.toolbarBorderRadius,
      itemSpacing: itemSpacing ?? this.itemSpacing,
      padding: padding ?? this.padding,
      bodyWidthRatio: bodyWidthRatio ?? this.bodyWidthRatio,
      tipHeightRatio: tipHeightRatio ?? this.tipHeightRatio,
      stripeHeight: stripeHeight ?? this.stripeHeight,
      stripeTopOffset: stripeTopOffset ?? this.stripeTopOffset,
      bodyColor: bodyColor ?? this.bodyColor,
      bodyColorDark: bodyColorDark ?? this.bodyColorDark,
      bodyColorLight: bodyColorLight ?? this.bodyColorLight,
      bodyStrokeColor: bodyStrokeColor ?? this.bodyStrokeColor,
      toolbarBackgroundColor:
          toolbarBackgroundColor ?? this.toolbarBackgroundColor,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      selectedOffset: selectedOffset ?? this.selectedOffset,
      unselectedOffset: unselectedOffset ?? this.unselectedOffset,
      toolbarShadow: toolbarShadow ?? this.toolbarShadow,
    );
  }

  /// Hazır konfigürasyonlar
  static const PenToolbarConfig small = PenToolbarConfig(
    penWidth: 20,
    penHeight: 44,
    toolbarHeight: 54,
    itemSpacing: 3,
    stripeHeight: 2,
    stripeTopOffset: 6,
    unselectedOffset: -10,
  );

  static const PenToolbarConfig medium = PenToolbarConfig();

  static const PenToolbarConfig large = PenToolbarConfig(
    penWidth: 34,
    penHeight: 72,
    toolbarHeight: 88,
    itemSpacing: 6,
    stripeHeight: 4,
    stripeTopOffset: 10,
    unselectedOffset: -16,
  );
}

/// Toolbar için kalem tanımı
class PenToolbarItem {
  final PenType type;
  final Color color;
  final bool enabled;
  final bool visible;
  final String? tooltip;

  const PenToolbarItem({
    required this.type,
    required this.color,
    this.enabled = true,
    this.visible = true,
    this.tooltip,
  });

  PenToolbarItem copyWith({
    PenType? type,
    Color? color,
    bool? enabled,
    bool? visible,
    String? tooltip,
  }) {
    return PenToolbarItem(
      type: type ?? this.type,
      color: color ?? this.color,
      enabled: enabled ?? this.enabled,
      visible: visible ?? this.visible,
      tooltip: tooltip ?? this.tooltip,
    );
  }

  /// Kalem tipinin Türkçe adı
  String get displayName {
    switch (type) {
      case PenType.pen:
        return 'Kalem';
      case PenType.pencil:
        return 'Kurşun Kalem';
      case PenType.pencilTip:
        return 'Sert Kalem';
      case PenType.ballpointPen:
        return 'Tükenmez Kalem';
      case PenType.gelPen:
        return 'Jel Kalem';
      case PenType.dashedPen:
        return 'Kesik Çizgi';
      case PenType.highlighter:
        return 'Fosforlu';
      case PenType.brushPen:
        return 'Fırça Kalem';
      case PenType.marker:
        return 'Marker';
      case PenType.neonHighlighter:
        return 'Neon Fosforlu';
      case PenType.fountainPen:
        return 'Dolma Kalem';
      case PenType.fineliner:
        return 'Fineliner';
      case PenType.crayon:
        return 'Boya Kalemi';
      case PenType.rulerPen:
        return 'Cetvelli Kalem';
    }
  }
}

/// Dikey kalem çizen CustomPainter
class PenPainter extends CustomPainter {
  final Color penColor;
  final PenType penType;
  final bool isSelected;
  final bool isEnabled;
  final PenToolbarConfig config;

  PenPainter({
    required this.penColor,
    required this.penType,
    this.isSelected = false,
    this.isEnabled = true,
    this.config = const PenToolbarConfig(),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final bodyWidth = size.width * config.bodyWidthRatio;
    final halfWidth = bodyWidth / 2;

    final tipTop = 0.0;
    final tipBottom = size.height * config.tipHeightRatio;
    final bodyTop = tipBottom;
    final bodyBottom = size.height;

    // Disabled durumunda opaklık düşür
    if (!isEnabled) {
      canvas.saveLayer(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.white.withValues(alpha: 0.5),
      );
    }

    _drawUniformBody(canvas, size, centerX, halfWidth, bodyTop, bodyBottom);
    _drawTip(canvas, size, centerX, halfWidth, tipTop, tipBottom);

    if (!isEnabled) {
      canvas.restore();
    }
  }

  void _drawUniformBody(Canvas canvas, Size size, double centerX,
      double halfWidth, double bodyTop, double bodyBottom) {
    final bodyPath = Path();
    bodyPath.addRRect(RRect.fromLTRBR(
      centerX - halfWidth,
      bodyTop,
      centerX + halfWidth,
      bodyBottom + 10,
      Radius.circular(halfWidth * 0.3),
    ));

    final bodyGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        config.bodyColorDark,
        config.bodyColor,
        config.bodyColorLight,
        config.bodyColor,
        config.bodyColorDark,
      ],
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    );

    canvas.drawPath(
      bodyPath,
      Paint()
        ..shader = bodyGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, bodyTop, halfWidth * 2, bodyBottom - bodyTop)),
    );

    canvas.drawPath(
      bodyPath,
      Paint()
        ..color = config.bodyStrokeColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );

    // Renk şeridi
    final stripeTop = bodyTop + config.stripeTopOffset;
    final stripeBottom = stripeTop + config.stripeHeight;
    final stripePath = Path();
    stripePath.addRRect(RRect.fromLTRBR(
      centerX - halfWidth + 0.5,
      stripeTop,
      centerX + halfWidth - 0.5,
      stripeBottom,
      const Radius.circular(1),
    ));

    final stripeGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(penColor, 0.15),
        penColor,
        _lighten(penColor, 0.15),
        penColor,
        _darken(penColor, 0.15),
      ],
    );

    canvas.drawPath(
      stripePath,
      Paint()
        ..shader = stripeGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth,
            stripeTop,
            halfWidth * 2,
            stripeBottom - stripeTop)),
    );

    // Cetvelli kalem için cetvel çizgileri
    if (penType == PenType.rulerPen) {
      final rulerStart =
          bodyTop + config.stripeTopOffset + config.stripeHeight + 5;
      for (var i = 0; i < 6; i++) {
        final y = rulerStart + i * 4.0;
        final isLong = i % 2 == 0;
        final lineWidth = isLong ? halfWidth * 0.6 : halfWidth * 0.35;
        canvas.drawLine(
          Offset(centerX - lineWidth, y),
          Offset(centerX + lineWidth, y),
          Paint()
            ..color = penColor.withValues(alpha: 0.5)
            ..strokeWidth = 0.6,
        );
      }
    }
  }

  void _drawTip(Canvas canvas, Size size, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    switch (penType) {
      case PenType.pen:
        _drawSharpTip(canvas, centerX, halfWidth, tipTop, tipBottom, penColor);
        break;
      case PenType.pencil:
        _drawPencilTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.pencilTip:
        _drawPencilTipSharp(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.ballpointPen:
        _drawBallpointPenTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.gelPen:
        _drawGelPenTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.dashedPen:
        _drawDashedPenTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.highlighter:
        _drawHighlighterTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.brushPen:
        _drawBrushPenTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.marker:
        _drawMarkerTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.neonHighlighter:
        _drawNeonHighlighterTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.fountainPen:
        _drawFountainPenTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.fineliner:
        _drawFinelinerTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.crayon:
        _drawCrayonTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
      case PenType.rulerPen:
        _drawRulerPenTip(canvas, centerX, halfWidth, tipTop, tipBottom);
        break;
    }
  }

  void _drawSharpTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom, Color tipColor) {
    final coneBottom = tipBottom;
    final coneTop = tipTop + (tipBottom - tipTop) * 0.35;

    final conePath = Path();
    conePath.moveTo(centerX - halfWidth, coneBottom);
    conePath.lineTo(centerX - halfWidth * 0.15, coneTop);
    conePath.lineTo(centerX + halfWidth * 0.15, coneTop);
    conePath.lineTo(centerX + halfWidth, coneBottom);
    conePath.close();

    final coneGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        config.bodyColorDark,
        config.bodyColor,
        config.bodyColorLight,
        config.bodyColor,
        config.bodyColorDark,
      ],
    );

    canvas.drawPath(
      conePath,
      Paint()
        ..shader = coneGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, coneTop, halfWidth * 2, coneBottom - coneTop)),
    );

    final tipPath = Path();
    tipPath.moveTo(centerX, tipTop);
    tipPath.lineTo(centerX - halfWidth * 0.15, coneTop);
    tipPath.lineTo(centerX + halfWidth * 0.15, coneTop);
    tipPath.close();

    final tipGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(tipColor, 0.1),
        tipColor,
        _lighten(tipColor, 0.15),
        tipColor,
        _darken(tipColor, 0.1),
      ],
    );

    canvas.drawPath(
      tipPath,
      Paint()
        ..shader = tipGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth * 0.15,
            tipTop,
            halfWidth * 0.3,
            coneTop - tipTop)),
    );
  }

  void _drawPencilTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final graphiteBottom = tipTop + (tipBottom - tipTop) * 0.3;
    final graphitePath = Path();
    graphitePath.moveTo(centerX, tipTop);
    graphitePath.lineTo(centerX - halfWidth * 0.2, graphiteBottom);
    graphitePath.lineTo(centerX + halfWidth * 0.2, graphiteBottom);
    graphitePath.close();

    canvas.drawPath(
      graphitePath,
      Paint()..color = _darken(penColor, 0.3),
    );

    final woodPath = Path();
    woodPath.moveTo(centerX - halfWidth * 0.2, graphiteBottom);
    woodPath.lineTo(centerX - halfWidth, tipBottom);
    woodPath.lineTo(centerX + halfWidth, tipBottom);
    woodPath.lineTo(centerX + halfWidth * 0.2, graphiteBottom);
    woodPath.close();

    final woodGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: const [
        Color(0xFFD2B48C),
        Color(0xFFF5DEB3),
        Color(0xFFFFE4C4),
        Color(0xFFF5DEB3),
        Color(0xFFD2B48C),
      ],
    );

    canvas.drawPath(
      woodPath,
      Paint()
        ..shader = woodGradient.createShader(Rect.fromLTWH(centerX - halfWidth,
            graphiteBottom, halfWidth * 2, tipBottom - graphiteBottom)),
    );

    for (var i = -1; i <= 1; i++) {
      canvas.drawLine(
        Offset(centerX + i * halfWidth * 0.25, graphiteBottom + 1),
        Offset(centerX + i * halfWidth * 0.7, tipBottom - 1),
        Paint()
          ..color = const Color(0xFFC4A484).withValues(alpha: 0.4)
          ..strokeWidth = 0.4,
      );
    }
  }

  void _drawPencilTipSharp(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final woodTop = tipTop + (tipBottom - tipTop) * 0.25;
    final woodPath = Path();
    woodPath.moveTo(centerX - halfWidth, tipBottom);
    woodPath.lineTo(centerX - halfWidth * 0.12, woodTop);
    woodPath.lineTo(centerX + halfWidth * 0.12, woodTop);
    woodPath.lineTo(centerX + halfWidth, tipBottom);
    woodPath.close();

    final woodGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: const [
        Color(0xFFBFA27E),
        Color(0xFFD4BC9A),
        Color(0xFFE8D4BC),
        Color(0xFFD4BC9A),
        Color(0xFFBFA27E),
      ],
    );

    canvas.drawPath(
      woodPath,
      Paint()
        ..shader = woodGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, woodTop, halfWidth * 2, tipBottom - woodTop)),
    );

    for (var i = -1; i <= 1; i++) {
      canvas.drawLine(
        Offset(centerX + i * halfWidth * 0.5, tipBottom - 1),
        Offset(centerX + i * halfWidth * 0.08, woodTop + 2),
        Paint()
          ..color = const Color(0xFFA68B5B).withValues(alpha: 0.35)
          ..strokeWidth = 0.5,
      );
    }

    final tipPath = Path();
    tipPath.moveTo(centerX, tipTop);
    tipPath.lineTo(centerX - halfWidth * 0.12, woodTop);
    tipPath.lineTo(centerX + halfWidth * 0.12, woodTop);
    tipPath.close();

    canvas.drawPath(
      tipPath,
      Paint()..color = _darken(penColor, 0.2),
    );
  }

  void _drawBallpointPenTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final plasticBottom = tipBottom;
    final plasticTop = tipTop + (tipBottom - tipTop) * 0.55;

    final plasticPath = Path();
    plasticPath.moveTo(centerX - halfWidth, plasticBottom);
    plasticPath.lineTo(centerX - halfWidth * 0.5, plasticTop);
    plasticPath.lineTo(centerX + halfWidth * 0.5, plasticTop);
    plasticPath.lineTo(centerX + halfWidth, plasticBottom);
    plasticPath.close();

    final plasticGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        config.bodyColorDark,
        config.bodyColor,
        config.bodyColorLight,
        config.bodyColor,
        config.bodyColorDark,
      ],
    );

    canvas.drawPath(
      plasticPath,
      Paint()
        ..shader = plasticGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth,
            plasticTop,
            halfWidth * 2,
            plasticBottom - plasticTop)),
    );

    final metalTop = tipTop + (tipBottom - tipTop) * 0.2;
    final metalPath = Path();
    metalPath.moveTo(centerX - halfWidth * 0.5, plasticTop + 1);
    metalPath.lineTo(centerX - halfWidth * 0.12, metalTop);
    metalPath.lineTo(centerX + halfWidth * 0.12, metalTop);
    metalPath.lineTo(centerX + halfWidth * 0.5, plasticTop + 1);
    metalPath.close();

    final metalGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.grey.shade500,
        Colors.grey.shade400,
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.grey.shade500,
      ],
    );

    canvas.drawPath(
      metalPath,
      Paint()
        ..shader = metalGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth * 0.5,
            metalTop,
            halfWidth,
            plasticTop - metalTop)),
    );

    final ballPath = Path();
    ballPath.moveTo(centerX, tipTop);
    ballPath.lineTo(centerX - halfWidth * 0.12, metalTop);
    ballPath.lineTo(centerX + halfWidth * 0.12, metalTop);
    ballPath.close();

    canvas.drawPath(
      ballPath,
      Paint()..color = _darken(penColor, 0.1),
    );

    canvas.drawCircle(
      Offset(centerX, tipTop + 2),
      1,
      Paint()..color = penColor,
    );
  }

  void _drawGelPenTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final coneTop = tipTop + (tipBottom - tipTop) * 0.2;
    final conePath = Path();
    conePath.moveTo(centerX - halfWidth * 0.65, tipBottom);
    conePath.quadraticBezierTo(
      centerX - halfWidth * 0.3,
      coneTop + 5,
      centerX,
      coneTop,
    );
    conePath.quadraticBezierTo(
      centerX + halfWidth * 0.3,
      coneTop + 5,
      centerX + halfWidth * 0.65,
      tipBottom,
    );
    conePath.close();

    final coneGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(penColor, 0.3),
        _darken(penColor, 0.15),
        penColor,
        _darken(penColor, 0.15),
        _darken(penColor, 0.3),
      ],
    );

    canvas.drawPath(
      conePath,
      Paint()
        ..shader = coneGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, coneTop, halfWidth * 2, tipBottom - coneTop)),
    );

    canvas.drawCircle(
      Offset(centerX, tipTop + 2.5),
      2,
      Paint()..color = _lighten(penColor, 0.2),
    );
    canvas.drawCircle(
      Offset(centerX - 0.5, tipTop + 2),
      0.8,
      Paint()..color = Colors.white.withValues(alpha: 0.6),
    );
  }

  void _drawDashedPenTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final coneTop = tipTop + (tipBottom - tipTop) * 0.3;
    final conePath = Path();
    conePath.moveTo(centerX - halfWidth, tipBottom);
    conePath.lineTo(centerX - halfWidth * 0.15, coneTop);
    conePath.lineTo(centerX + halfWidth * 0.15, coneTop);
    conePath.lineTo(centerX + halfWidth, tipBottom);
    conePath.close();

    final coneGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        config.bodyColorDark,
        config.bodyColor,
        config.bodyColorLight,
        config.bodyColor,
        config.bodyColorDark,
      ],
    );

    canvas.drawPath(
      conePath,
      Paint()
        ..shader = coneGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, coneTop, halfWidth * 2, tipBottom - coneTop)),
    );

    final dashY = tipTop + 2;
    for (var i = 0; i < 3; i++) {
      canvas.drawCircle(
        Offset(centerX, dashY + i * 3.5),
        1.2,
        Paint()..color = penColor,
      );
    }
  }

  void _drawHighlighterTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final colorBodyTop = tipTop + (tipBottom - tipTop) * 0.45;
    final colorBodyPath = Path();
    colorBodyPath.addRRect(RRect.fromLTRBR(
      centerX - halfWidth * 0.95,
      colorBodyTop,
      centerX + halfWidth * 0.95,
      tipBottom,
      const Radius.circular(2),
    ));

    canvas.drawPath(
      colorBodyPath,
      Paint()..color = penColor.withValues(alpha: 0.4),
    );

    final tipPath = Path();
    tipPath.moveTo(centerX - halfWidth * 0.9, colorBodyTop);
    tipPath.lineTo(centerX - halfWidth * 0.6, tipTop + 2);
    tipPath.lineTo(centerX + halfWidth * 0.6, tipTop);
    tipPath.lineTo(centerX + halfWidth * 0.9, colorBodyTop);
    tipPath.close();

    canvas.drawPath(
      tipPath,
      Paint()..color = penColor.withValues(alpha: 0.85),
    );
  }

  void _drawBrushPenTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final brushPath = Path();
    brushPath.moveTo(centerX, tipTop);
    brushPath.quadraticBezierTo(
      centerX - halfWidth * 0.6,
      tipTop + (tipBottom - tipTop) * 0.4,
      centerX - halfWidth * 0.8,
      tipBottom,
    );
    brushPath.lineTo(centerX + halfWidth * 0.8, tipBottom);
    brushPath.quadraticBezierTo(
      centerX + halfWidth * 0.6,
      tipTop + (tipBottom - tipTop) * 0.4,
      centerX,
      tipTop,
    );
    brushPath.close();

    final brushGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(penColor, 0.25),
        _darken(penColor, 0.1),
        penColor,
        _darken(penColor, 0.1),
        _darken(penColor, 0.25),
      ],
    );

    canvas.drawPath(
      brushPath,
      Paint()
        ..shader = brushGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, tipTop, halfWidth * 2, tipBottom - tipTop)),
    );

    for (var i = -2; i <= 2; i++) {
      canvas.drawLine(
        Offset(centerX + i * 1.5, tipBottom - 2),
        Offset(centerX + i * 0.3, tipTop + 4),
        Paint()
          ..color = _darken(penColor, 0.35).withValues(alpha: 0.4)
          ..strokeWidth = 0.4,
      );
    }
  }

  void _drawMarkerTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final bodyTop = tipTop + (tipBottom - tipTop) * 0.35;
    final bodyPath = Path();
    bodyPath.addRRect(RRect.fromLTRBR(
      centerX - halfWidth * 0.9,
      bodyTop,
      centerX + halfWidth * 0.9,
      tipBottom,
      const Radius.circular(2),
    ));

    final bodyGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(penColor, 0.12),
        penColor,
        _lighten(penColor, 0.12),
        penColor,
        _darken(penColor, 0.12),
      ],
    );

    canvas.drawPath(
      bodyPath,
      Paint()
        ..shader = bodyGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, bodyTop, halfWidth * 2, tipBottom - bodyTop)),
    );

    final tipRect = RRect.fromLTRBR(
      centerX - halfWidth * 0.7,
      tipTop,
      centerX + halfWidth * 0.7,
      bodyTop + 2,
      const Radius.circular(1),
    );

    canvas.drawRRect(
      tipRect,
      Paint()..color = _darken(penColor, 0.2),
    );
  }

  void _drawNeonHighlighterTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final glowPath = Path();
    final colorBodyTop = tipTop + (tipBottom - tipTop) * 0.4;
    glowPath.addRRect(RRect.fromLTRBR(
      centerX - halfWidth * 1.0,
      colorBodyTop,
      centerX + halfWidth * 1.0,
      tipBottom,
      const Radius.circular(2),
    ));

    canvas.drawPath(
      glowPath,
      Paint()
        ..color = penColor.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
    );

    canvas.drawPath(
      glowPath,
      Paint()..color = penColor.withValues(alpha: 0.5),
    );

    final tipPath = Path();
    tipPath.moveTo(centerX - halfWidth * 0.95, colorBodyTop);
    tipPath.lineTo(centerX - halfWidth * 0.65, tipTop + 1);
    tipPath.lineTo(centerX + halfWidth * 0.65, tipTop);
    tipPath.lineTo(centerX + halfWidth * 0.95, colorBodyTop);
    tipPath.close();

    canvas.drawPath(
      tipPath,
      Paint()..color = penColor.withValues(alpha: 0.9),
    );

    canvas.drawLine(
      Offset(centerX - halfWidth * 0.3, tipTop + 2),
      Offset(centerX + halfWidth * 0.2, tipTop + 1),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.7)
        ..strokeWidth = 1
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawFountainPenTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final nibHeight = (tipBottom - tipTop) * 0.7;
    final nibTop = tipBottom - nibHeight;
    final nibWidth = halfWidth * 0.8;

    final nibPath = Path();
    nibPath.moveTo(centerX, tipTop + 2);
    nibPath.lineTo(centerX - nibWidth, nibTop + nibHeight * 0.4);
    nibPath.quadraticBezierTo(
      centerX - nibWidth * 1.1,
      tipBottom,
      centerX,
      tipBottom,
    );
    nibPath.quadraticBezierTo(
      centerX + nibWidth * 1.1,
      tipBottom,
      centerX + nibWidth,
      nibTop + nibHeight * 0.4,
    );
    nibPath.close();

    final nibGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(penColor, 0.4),
        _darken(penColor, 0.2),
        penColor,
        _darken(penColor, 0.2),
        _darken(penColor, 0.4),
      ],
    );

    canvas.drawPath(
      nibPath,
      Paint()
        ..shader = nibGradient.createShader(Rect.fromLTWH(
            centerX - nibWidth, tipTop, nibWidth * 2, tipBottom - tipTop)),
    );

    final holeY = tipTop + (tipBottom - tipTop) * 0.55;
    canvas.drawCircle(
      Offset(centerX, holeY),
      1.8,
      Paint()..color = _darken(penColor, 0.5),
    );

    canvas.drawLine(
      Offset(centerX, tipTop + 3),
      Offset(centerX, holeY - 2),
      Paint()
        ..color = _darken(penColor, 0.5)
        ..strokeWidth = 0.8,
    );
  }

  void _drawFinelinerTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final conePath = Path();
    conePath.moveTo(centerX, tipTop + 3);
    conePath.lineTo(centerX - halfWidth * 0.65, tipBottom);
    conePath.lineTo(centerX + halfWidth * 0.65, tipBottom);
    conePath.close();

    final coneGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.grey.shade500,
        Colors.grey.shade300,
        Colors.white,
        Colors.grey.shade300,
        Colors.grey.shade500,
      ],
    );

    canvas.drawPath(
      conePath,
      Paint()
        ..shader = coneGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, tipTop, halfWidth * 2, tipBottom - tipTop)),
    );

    canvas.drawCircle(
      Offset(centerX, tipTop + 1.5),
      1.5,
      Paint()..color = penColor,
    );
  }

  void _drawCrayonTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final crayonBodyTop = tipTop + (tipBottom - tipTop) * 0.5;
    final bodyPath = Path();
    bodyPath.addRRect(RRect.fromLTRBR(
      centerX - halfWidth * 0.85,
      crayonBodyTop,
      centerX + halfWidth * 0.85,
      tipBottom,
      const Radius.circular(2),
    ));

    final bodyGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        _darken(penColor, 0.18),
        penColor,
        _lighten(penColor, 0.12),
        penColor,
        _darken(penColor, 0.18),
      ],
    );

    canvas.drawPath(
      bodyPath,
      Paint()
        ..shader = bodyGradient.createShader(Rect.fromLTWH(centerX - halfWidth,
            crayonBodyTop, halfWidth * 2, tipBottom - crayonBodyTop)),
    );

    final tipPath = Path();
    tipPath.moveTo(centerX, tipTop);
    tipPath.quadraticBezierTo(
      centerX - halfWidth * 0.3,
      crayonBodyTop * 0.6 + tipTop * 0.4,
      centerX - halfWidth * 0.8,
      crayonBodyTop,
    );
    tipPath.lineTo(centerX + halfWidth * 0.8, crayonBodyTop);
    tipPath.quadraticBezierTo(
      centerX + halfWidth * 0.3,
      crayonBodyTop * 0.6 + tipTop * 0.4,
      centerX,
      tipTop,
    );
    tipPath.close();

    canvas.drawPath(
      tipPath,
      Paint()
        ..shader = bodyGradient.createShader(Rect.fromLTWH(centerX - halfWidth,
            tipTop, halfWidth * 2, crayonBodyTop - tipTop)),
    );
  }

  void _drawRulerPenTip(Canvas canvas, double centerX, double halfWidth,
      double tipTop, double tipBottom) {
    final coneTop = tipTop + (tipBottom - tipTop) * 0.3;
    final conePath = Path();
    conePath.moveTo(centerX - halfWidth, tipBottom);
    conePath.lineTo(centerX - halfWidth * 0.15, coneTop);
    conePath.lineTo(centerX + halfWidth * 0.15, coneTop);
    conePath.lineTo(centerX + halfWidth, tipBottom);
    conePath.close();

    final coneGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        config.bodyColorDark,
        config.bodyColor,
        config.bodyColorLight,
        config.bodyColor,
        config.bodyColorDark,
      ],
    );

    canvas.drawPath(
      conePath,
      Paint()
        ..shader = coneGradient.createShader(Rect.fromLTWH(
            centerX - halfWidth, coneTop, halfWidth * 2, tipBottom - coneTop)),
    );

    final tipPath = Path();
    tipPath.moveTo(centerX, tipTop);
    tipPath.lineTo(centerX - halfWidth * 0.15, coneTop);
    tipPath.lineTo(centerX + halfWidth * 0.15, coneTop);
    tipPath.close();

    canvas.drawPath(tipPath, Paint()..color = penColor);
  }

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color _darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  bool shouldRepaint(covariant PenPainter oldDelegate) {
    return oldDelegate.penColor != penColor ||
        oldDelegate.penType != penType ||
        oldDelegate.isSelected != isSelected ||
        oldDelegate.isEnabled != isEnabled ||
        oldDelegate.config != config;
  }
}

/// Tek bir kalem item widget'ı
class PenItem extends StatelessWidget {
  final PenType penType;
  final Color penColor;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback? onTap;
  final PenToolbarConfig config;

  const PenItem({
    super.key,
    required this.penType,
    required this.penColor,
    required this.isSelected,
    this.isEnabled = true,
    this.onTap,
    this.config = const PenToolbarConfig(),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.4,
        child: SizedBox(
          width: config.penWidth,
          height: config.penHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedPositioned(
                duration: config.animationDuration,
                curve: config.animationCurve,
                bottom: isSelected
                    ? config.selectedOffset
                    : config.unselectedOffset,
                left: 0,
                right: 0,
                child: CustomPaint(
                  size: Size(config.penWidth, config.penHeight),
                  painter: PenPainter(
                    penColor: penColor,
                    penType: penType,
                    isSelected: isSelected,
                    isEnabled: isEnabled,
                    config: config,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Ana kalem toolbar widget'ı
class PenToolbar extends StatefulWidget {
  final List<PenToolbarItem> pens;
  final int initialSelectedIndex;
  final ValueChanged<int>? onPenSelected;
  final PenToolbarConfig config;

  const PenToolbar({
    super.key,
    required this.pens,
    this.initialSelectedIndex = 0,
    this.onPenSelected,
    this.config = const PenToolbarConfig(),
  });

  @override
  State<PenToolbar> createState() => _PenToolbarState();
}

class _PenToolbarState extends State<PenToolbar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(PenToolbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex) {
      _selectedIndex = widget.initialSelectedIndex;
    }
  }

  void _onPenTap(int index) {
    final pen = widget.pens[index];
    if (!pen.enabled) return;

    if (_selectedIndex != index) {
      setState(() => _selectedIndex = index);
      widget.onPenSelected?.call(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final visiblePens = widget.pens.where((pen) => pen.visible).toList();

    return SizedBox(
      height: widget.config.toolbarHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: widget.config.toolbarBackgroundColor,
                borderRadius:
                    BorderRadius.circular(widget.config.toolbarBorderRadius),
                boxShadow: widget.config.defaultShadow,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: widget.config.padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(visiblePens.length, (index) {
                  final pen = visiblePens[index];
                  final originalIndex = widget.pens.indexOf(pen);
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < visiblePens.length - 1
                          ? widget.config.itemSpacing
                          : 0,
                    ),
                    child: pen.tooltip != null
                        ? Tooltip(
                            message: pen.tooltip!,
                            child: _buildPenItem(pen, originalIndex),
                          )
                        : _buildPenItem(pen, originalIndex),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -20,
            height: 20,
            child: Container(color: widget.config.toolbarBackgroundColor),
          ),
        ],
      ),
    );
  }

  Widget _buildPenItem(PenToolbarItem pen, int index) {
    return PenItem(
      penType: pen.type,
      penColor: pen.color,
      isSelected: _selectedIndex == index,
      isEnabled: pen.enabled,
      config: widget.config,
      onTap: () => _onPenTap(index),
    );
  }
}
