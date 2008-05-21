$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

#   A port of John Gruber's title casing script to Ruby.
#   2008-05-21 Jim Lindley http://jimlindley.com
#
#   --- Original Copyright Notice ---
#  
#   This filter changes all words to Title Caps, and attempts to be clever
#   about *un*capitalizing small words like a/an/the in the input.
#
#   The list of "small words" which are not capped comes from
#   the New York Times Manual of Style, plus 'vs' and 'v'. 
#
#   John Gruber
#   http://daringfireball.net/
#   10 May 2008
#
#   License: http://www.opensource.org/licenses/mit-license.php
#
class TitleCase

  def initialize(string)
    @raw_string        = string
    convert
  end

  def to_s
    @titlecase_string
  end
  
  def original
    @raw_string
  end
  
  def self.small_words
    @small_words = %w(a an and as at but by en for if in of on or the to v[.]? via vs[.]?)
  end

  def self.small_words=(words)
    @small_words = words
  end
  
  def self.small_words_re
    small_words.join('|')
  end
  
  private
  
    def convert
      @titlecase_string = ""
      @raw_string.each_line do |line|
        line.split(/( [:.;?!][ ] | (?:[ ]|^)["“] )/ux).each do |sub_phrase|
          
          # upper case phrase words
          sub_phrase = uppercase_phrase(sub_phrase)

          # lower case small words
          sub_phrase.gsub!(/\b(#{TitleCase.small_words_re})\b/ui){|small| small.downcase }

          # upper case small words at start of phrase
          sub_phrase.gsub!(/\A[[:punct:]]*(#{TitleCase.small_words_re})\b/u){|small| small.capitalize }

          # upper case small words at end of phrase
          sub_phrase.gsub!(/\b(#{TitleCase.small_words_re})[[:punct:]]*\Z/u){|small| small.capitalize }

          sub_phrase = special_cases(sub_phrase)
          @titlecase_string << sub_phrase
        end
      end      
    end
    
    def uppercase_phrase(phrase)
      phrase.gsub!(/\b([[:alpha:]][[:lower:].'’]*)\b/u) do |word|
        if /[[:alpha:]][.][[:alpha:]]/u.match(word)
          word
        else
          word.downcase.capitalize
        end
      end
      phrase
    end
    
    def special_cases(phrase)
      phrase.gsub!(/\b(vs?\.?)\b/ui){ |vs| vs.downcase  }
      phrase.gsub!(/(['’]S)\b/u) { |aps| aps.downcase }
      phrase.gsub!(/\b(AT&T|Q&A)\b/ui){|special| special.upcase }
      phrase
    end
  
end

class String

  def titlecase
    TitleCase.new(self).to_s
  end

end


