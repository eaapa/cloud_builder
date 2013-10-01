require 'cloud_builder'

describe CloudBuilder::Parameter do
  
  before(:all) do
    @stack = CloudBuilder::Stack.new(File.expand_path('../../../stacks/example.rb', __FILE__))
  end
  
  it "should include all parameters in json_data" do
    
    brick = CloudBuilder::Parameter.new(@stack) do
      type "SomeType"
      description "Desc"
      default "default_value"
      min_length 1
      max_length 16
      allowed_values ["One", "Two"]
      allowed_pattern "[a-zA-Z][a-zA-Z0-9]*"
      constraint_description "must match regex"
      no_echo true
    end
    
    brick.to_json_data.should include(
      "Type" => "SomeType",
      "Description" => "Desc",
      "Default" => "default_value",
      "MinLength" => 1,
      "MaxLength" => 16,
      "AllowedValues" => ["One", "Two"],
      "AllowedPattern" => "[a-zA-Z][a-zA-Z0-9]*",
      "ConstraintDescription" => "must match regex",
      "NoEcho" => true,
    )
  end

end