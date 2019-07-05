require './EnumerablesRuby/main.rb'

RSpec.describe Enumerable do
    describe " #my_each" do
        it "test1" do
            expect([1,4,3,2].my_each{
                |x| return x
            }).to eql([1,4,3,2])
        end
    end
end