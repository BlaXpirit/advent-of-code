inp = File.read "input.txt"

require "json"

class Parser < JSON::Parser
  @sum = 0

  def parse_value
    case token.type
    when :INT
      @sum += token.int_value
    when :FLOAT
      @sum += token.float_value
    when :"{"
      previous_sum = @sum
      obj = parse_object
      if obj.values.includes? "red"
        @sum = previous_sum
        return nil
      end
      return obj
    end
    super
  end

  def sum
    parse
    @sum
  end
end

p Parser.new(inp).sum
