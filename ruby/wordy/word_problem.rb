class WordProblem

  attr_reader :question

  def initialize(input)
    @question = input
  end

  def answer
    parse_question
  end

  def parse_question
    regex = %r{What is ([-?\d]+) plus ([-?\d]+)?}
    @question.scan(regex)#.flatten.inject(0) { |sum, i| sum + i.to_i }
  end
end
