class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @contents = File.read(filename)
    .downcase
    .gsub(/\W/, ' ')
    .split(" ")
    .reject { |e| STOP_WORDS.include? e }
    @words = Hash.new
    puts @contents
    @contents.uniq.each do |x|
      @words["#{x}"] = @contents.count(x)
    end
  end
  # binding.pry

  def frequency(word)
    # take word and count the amount of times it appears in the txt file
    @words[word]
  end

  def frequencies

  end

  def top_words(number)
    #show the words that appear above a certain number
    @words.take(number)
  end

  def print_report

  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
