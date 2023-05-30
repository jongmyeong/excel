part of excel;

const MAX_COL = 16384;

class Drawing {
  Sheet _sheet;
  Map<int, OneCellAnchor> _oneCellAnchors = {};
  Map<String, String> _relTargets = {};

  Drawing(Sheet sheet) : _sheet = sheet {
    _sheet._drawing = this;
  }

  void addOneCellAnchor(OneCellAnchor anchor) {
    int index = anchor.row * MAX_COL + anchor.col;
    _oneCellAnchors[index] = anchor;
  }

  OneCellAnchor? getOneCellAnchors(int row, int col) {
    int index = row * MAX_COL + col;
    if (_oneCellAnchors.containsKey(index)) {
      return _oneCellAnchors[index];
    }
    return null;
  }

  String saveFillBlipIfFound(int row, int col, String outputPath) {
    OneCellAnchor? oca = getOneCellAnchors(row, col);
    if (oca == null) {
      return "";
    }

    return writeFillBlip(oca.blipFillId, outputPath);
  }

  String writeFillBlip(String blipId, String outputPath) {
    String? value = _relTargets[blipId];
    if (value == null) {
      return "";
    }

    var file = _sheet._excel._archive.findFile(value);
    if (file == null) {
      return "";
    }

    path.Context pContext = path.Context(style: path.Style.posix);
    String extension = pContext.extension(value);

    outputPath += extension;
    OutputFileStream ofs = OutputFileStream(outputPath);
    file.writeContent(ofs);
    ofs.close();
    return outputPath;
  }
}
