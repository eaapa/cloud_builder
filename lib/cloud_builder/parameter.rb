module CloudBuilder
  class Parameter < JSONable
    def initialize(stack, &block)
      @stack   = stack
            
      @Type = 'String'
      @block = block
      instance_exec(&block)
    end
    
    def to_hash
      hash = super.to_hash
      hash.delete('block')
      hash
    end

    def globals
      @stack.globals
    end
    
    def to_json_data
      json = { "Type" => @Type }
      json["Default"] = @Default unless @Default.nil?
      json["Description"] = @Description unless @Description.nil?
      json["MinLength"] = @MinLength unless @MinLength.nil?
      json["MaxLength"] = @MaxLength unless @MaxLength.nil?
      json["AllowedValues"] = @AllowedValues unless @AllowedValues.nil?
      json["AllowedPattern"] = @AllowedPattern unless @AllowedPattern.nil?
      json["ConstraintDescription"] = @ConstraintDescription unless @ConstraintDescription.nil?
      json["NoEcho"] = @NoEcho unless @NoEcho.nil?
      json
    end
    
    def default value
      @Default = value
    end
    
    def type value
      @Type = value
    end
    
    def description value
      @Description = value
    end
    
    def min_length value
      @MinLength = value
    end
    
    def max_length value
      @MaxLength = value
    end
    
    def allowed_values value
      @AllowedValues = value
    end
    
    def allowed_pattern value
      @AllowedPattern = value
    end
    
    def constraint_description value
      @ConstraintDescription = value
    end
    
    def no_echo value
      @NoEcho = value
    end
    
    def brick
      @block.binding.eval('brick')
    end
    # def method_missing(field, *params)
      # instance_variable_set("@#{field}", value)
      # print @block.binding.eval('@hash')
      # null
    # end
  end
end

