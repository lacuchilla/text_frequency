class Words

  def initialize
    @words_searched = {}
  end
  # filepath = ARGV[0]
  def word_frequency(filepath = ARGV[0], words_to_search = ARGV[1..-1])
    puts filepath
    words_to_search.each do |word|
      @words_searched[word] = 0
    end

    file = File.open(filepath, "r")
    content = file.read
    content.each_line do |line|
      #save variable of each line, make it pass through regex to remove punctuation and newline characters

      puts line
    end
    puts @words_searched
    # puts content
  # def word_frequency(text_documents)#words to look for
    # IO.foreach(filepath) {|x| print "GOT", x}
  #create empty dictionary of words to look for
  #for each text document
  #open the document
  #strip out punctuation, separate by whitespace, convert text to lowercase
  #save as the text that we'll checek
  #for each word in the document
  #if it's one of the words we're looking for, add it to the dictionary
  end
end

yes = Words.new
print yes.word_frequency
