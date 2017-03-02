class Words

  # def initialize
  #
  # end

  def word_frequency(args = ARGV[0..-1])
    words_hash = {}
    files_to_check = []
    words_to_search = []
    arguments = args.to_a
    arguments.each do |a|
      a[-4..-1] == ".txt" ? files_to_check << a : words_to_search << a
    end

    words_to_search.each do |word|
      words_hash[word] = 0
    end

    files_to_check.each do |file|
      words_hash.each do |key, value|
        words_hash[key] = 0
      end
      
      open_file = File.readlines(file)
      open_file.each do |line|
        word = line.split(" ")
        word.each do |split_word|
          cleaned_word = split_word.gsub(/[-,.:;"]/, '')
          downcased_word = cleaned_word.downcase
          if words_hash.key?(downcased_word)
            words_hash[downcased_word] += 1
            # puts "yay"
          else
            next
          end
          # puts downcased_word
        end
      end
      print words_hash

    end
    # puts words_hash
    # puts files_to_check
    # puts words_to_search

  end
end

yes = Words.new
print yes.word_frequency
