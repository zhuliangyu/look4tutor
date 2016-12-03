line_num=0
beginNumber=0
endNumber=0
File.open('cities.txt').each do |line|

  beginNumber=line.index(':').to_f+2
  endNumber=line.length-1

  newLine=line[beginNumber,endNumber]
  newLine.insert(0,'"')
  newLine.insert(-1,'",')
  newLine.delete!("\n")
  puts newLine



end