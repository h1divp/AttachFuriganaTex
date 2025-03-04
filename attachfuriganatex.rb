require 'natto'
require 'nkf'

# Converts the kanji in the given text
# to its furigana equivalent
def attatchfuri(s)

  begin
  nm = Natto::MeCab.new()
  kanji_parse = Natto::MeCab.new('-F%f[7]') # Will only work on words that are in kanji, gets reading in katakana

  memo = []

  # parse the input string by node
    nm.parse(s) do |n| # parses words normally
     # puts n.surface
     if n.char_type==2 # kanji has node char type 2
       yomi_kata = kanji_parse.parse(n.surface) # take the yomi output (only katakana is available)
       yomi_kata = yomi_kata[0...-4] # removes "EOS" and a newline character that comes from n.surface
       yomi_hira = NKF.nkf('-h1 -w', yomi_kata) # use NKF to convert to hiragana, assuming UTF-8 char encoding
       memo << "\\ruby[g]" + "{" + n.surface + "}" + "{" + yomi_hira + "}" #latex output
     else
       memo << n.surface # leave other nodes as-is
     end
    end
    rescue Natto::MeCabError
  end

  memo.join
end

puts "Enter Japanese:"
text = gets.chomp
puts ""
puts "======BEGIN LATEX======"
puts ""
puts attatchfuri(text)
