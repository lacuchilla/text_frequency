class Words

  def initialize
    @words_searched = {}
  end

  def word_frequency(args = ARGV[0..-1])
    filepath = []
    words_to_search = []
    arguments = args.to_a
    arguments.each do |a|
      a[-4..-1] == ".txt" ? filepath << a : words_to_search << a
    end

    words_to_search.each do |word|
      @words_searched[word] = 0
    end

    filepath.each do |f|
      # file = File.open(f, "r")
      content = File.readlines(f)
      # content.each_line do |line|
      content.each do |c|
      #save variable of each line, make it pass through regex to remove punctuation and newline characters
        puts c
        puts "BREAK"
      end
    end
    puts @words_searched
    puts filepath
    puts words_to_search
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
