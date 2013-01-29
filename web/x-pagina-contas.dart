import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'package:js/js.dart' as js;

class PaginaContas extends WebComponent {
  String graficoSaldo = "https://docs.google.com/a/fear-airsoft.com/spreadsheet/oimg?key=0AoNj2G61OMg-dDhVbFJWbDRoMVFZeDFCMGFiS21FSmc&oid=7&zx=7a5nciaim3lc";
  String graficoCustos = "https://docs.google.com/a/fear-airsoft.com/spreadsheet/oimg?key=0AoNj2G61OMg-dDhVbFJWbDRoMVFZeDFCMGFiS21FSmc&oid=5&zx=9p9kcll4dk9";
  String graficoBalanco = "https://docs.google.com/a/fear-airsoft.com/spreadsheet/oimg?key=0AoNj2G61OMg-dDhVbFJWbDRoMVFZeDFCMGFiS21FSmc&oid=3&zx=1yuvo8fjfe0m";
  
  void inserted() {
    js.scoped((){
      var script = new ScriptElement();
      script.type = "text/javascript";
      script.src = "https://ajax.googleapis.com/ajax/static/modules/gviz/1.0/chart.js";
      script.innerHtml = "{'dataSourceUrl':'https://docs.google.com/a/fear-airsoft.com/spreadsheet/tq?key=0AoNj2G61OMg-dDhVbFJWbDRoMVFZeDFCMGFiS21FSmc&transpose=1&headers=1&range=A1%3AU3&gid=5&pub=1','options':{'vAxes':[{'useFormatFromData':true,'title':null,'minValue':null,'logScale':false,'viewWindow':{'min':null,'max':null},'maxValue':null},{'useFormatFromData':true,'minValue':null,'logScale':false,'viewWindow':{'min':null,'max':null},'maxValue':null}],'titleTextStyle':{'bold':true,'color':'#000','fontSize':16},'booleanRole':'certainty','title':'Custos','animation':{'duration':0},'legend':'right','hAxis':{'useFormatFromData':true,'minValue':null,'viewWindowMode':null,'viewWindow':null,'maxValue':null},'isStacked':true,'tooltip':{},'width':1440,'height':609},'state':{},'view':{},'chartType':'ColumnChart','chartName':'Gr\u00e1fico1'}";
      query("#graficoSaldo").children.add(script);
      //document.body.append(script);
    });
  }
}

