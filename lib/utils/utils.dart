import 'package:date_format/date_format.dart';

String getTextTeaserHeading(String fullText){
  if(fullText.length > 25){
    return fullText.substring(0, 24) + ' [...]';
  }else{
    return fullText;
  }
}

String getTextTeaserContent(String fullText){
  if(fullText.length > 50){
    return fullText.substring(0, 49) + ' [...]';
  }else{
    return fullText;
  }
}

String formatFBDate(DateTime date){
  return formatDate(date, [yyyy, ' ', MM, ' ', dd, ', ', HH , ':', mm]);
}

