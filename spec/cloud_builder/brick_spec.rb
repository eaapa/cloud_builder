require 'cloud_builder'

describe CloudBuilder::Brick do
  
  before(:all) do
    @stack = CloudBuilder::Stack.new(File.expand_path('../../../stacks/example.rb', __FILE__))
  end
  
  it "should eval example_tags brick file" do
    
    brick = CloudBuilder::Brick.new(@stack, :example_tags, {})
    
    brick.globals.example_tags.should_not be_nil
  end
  
  it "should allow non existing brick file" do
    
    brick = CloudBuilder::Brick.new(@stack, :empty_brick, {})
    brick.globals.example_tags.should_not be_nil
  end
  
end