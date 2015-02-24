require "spec_helper"
require "zombie"
describe "A Zombie" do
it "has no brains" do
zombie=Zombie.new
zombie.brains.should < 1
end
end
