class Words
  #args = ARGV[0..-1] returns ARGV array containing all of the elements passed to the script
  def word_frequency(args = ARGV[0..-1])
    #words_hash is a hash to put the words that we are searching for text frequency
    words_hash = {}
    #word_count is the total number of words in a given text file
    word_count = 0
    #words_in_current_line counts the number of words in the current line being read once the file is open. After the line is read, this number is added to word_count
    words_in_current_line = 0
    #files_to_check is an array to hold the txt files that will be read
    files_to_check = []
    #words_to_search is an array to hold the words that we will search for
    words_to_search = []
    #this saves off the ARGV array into a variable
    arguments = args.to_a
    #this loop iterates through all of the items in the array. If the last four characters in the element currently being checked are ".txt", the element is added to the files_to_check array, otherwise it is added to the words_to_search array
    arguments.each do |a|
      a[-4..-1] == ".txt" ? files_to_check << a : words_to_search << a
    end
    #this loop populates the words_hash and sets each element in the words_to_search array as a key in the hash with a starting value of 0
    words_to_search.each do |word|
      words_hash[word] = 0
    end
    #this loop is the process of reading each of the files and checking for instances of the words we are looking for
    files_to_check.each do |file|
      #this loop resets the value of each of the keys in the words_hash array to 0, since we are wanting to return counts from each file individually, not a count of all of the files searched
      words_hash.each do |key, value|
        words_hash[key] = 0
      end
      #this section opens one file
      open_file = File.readlines(file)
      #this section reads the file line by line
      open_file.each do |line|
        #sets the words_in_current_line variable to 0
        words_in_current_line = 0
        #this section splits the line into an array of words
        word = line.split(" ")
        #this iterates through each word in the current line
        word.each do |split_word|
          #this filters out punctuation marks that may be attached to the current word
          cleaned_word = split_word.gsub(/[,.:;"?!]/, '')
          #this makes sure the word is downcased so we can look for matches in the words hash
          downcased_word = cleaned_word.downcase
          #this checks to see if there is a trailing dash at the end of the word. If so, we remove it. Words with a hyphen in the middle are counted as one word, like "sea-captain".
          if downcased_word[-1] == "-"
            downcased_word.chomp!("-")
          end
          #this increments the count of the words in the current file by one
          words_in_current_line += 1
          #this checks to see if the current word is a key that is in the words_hash. If it's there, we increment that key's value by 1, otherwise we move onto the next word in the line
          if words_hash.key?(downcased_word)
            words_hash[downcased_word] += 1
          else
            next
          end
        end
        #once all of the words in the line have been read, the total is added to the word_count for that file.
        word_count += words_in_current_line
      end
      #this returns each word searched and the text frequency for the word in the current file.
      puts "For #{file}:"
      words_hash.each do |key, value|
        puts "Number of occurrences for #{key}: #{value}"
        puts "Total number of words in the file: #{word_count}"
        text_frequency = words_hash[key]/word_count.to_f
        puts "Text frequency for #{key}: #{text_frequency}"
      end
    end
  end
end

#this creates a new instance of Words and calls the word_frequency function
yes = Words.new
print yes.word_frequency
