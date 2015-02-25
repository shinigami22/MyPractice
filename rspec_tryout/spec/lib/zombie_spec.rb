require "spec_helper"
require "zombie"
describe "A Zombie" do
it "has no brains" do
zombie=Zombie.new
zombie.brains.should == 1
end
end
describe "A Zombie" do
it "is a zombie" do
zombie=Zombie.new
zombie.name.should == 'Ash'
end
end
