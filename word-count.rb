require "csv"

wc = {}

#Dir.glob("playframework/framework/src/**/*.scala").map{|path|
#Dir.glob("scalike-sample/app/**/*.scala").map{|path|
#Dir.glob("*.scala").map{|path|
Dir.glob("scalaz/core/**/*.scala").map{|path|
  open(path).read
}.map{|f|
  f.gsub(/\/[*][*]\n [*] Created by.+[.]\n [*]\//m, "").
    gsub(/^import.+$/, "").
    gsub(/^package.+$/, "").
    gsub("(", " ( ").
    gsub(")", " ) ").
    gsub("{", " { ").
    gsub("}", " } ").
    gsub(":", " :  ").
    gsub("[", " [ ").
    gsub("]", " ] ").
    gsub(".", " . ").
    gsub(",", " , ").
    gsub("\"", " \" ").
    gsub(/\/\/.+$/, "").
    split(/[ \n\r\t]+/)
}.map{|f|
  f.map{|s|
    wc[s] = wc.fetch(s, 0) + 1
  }
}

wcr = wc.sort{|a,b|a[1] <=> b[1]}.reverse
CSV.open("result.csv", "wb") do |csv|
  wcr.each do |row|
    csv << row
  end
