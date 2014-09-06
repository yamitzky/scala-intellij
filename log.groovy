// underscores for args by intellij
def result = 'Logger.debug(s\"'+_1+' [';
_2.each {
  result += it+'=$'+it+', '
};
if(_2.size() > 0) {
  result = result.substring(0, result.length()-2);
};
result+=']\"';
result+=')';
return result;
