module Enumerable
    def my_each        
        for i in 0...self.my_count do
            yield(self[i])
        end
        self
    end

    def my_each_with_index
        for i in 0...self.my_count do
            yield(self[i],i)
        end
        self
    end

    def my_select #3
        new_object = []
        self.my_each{|val| #do not use .each method, maybe .my_each
            new_object.push(val) if yield(val)
        }
        return new_object
    end
    def my_all? #4         
        self.my_each do |val|
            return false if !yield(val)
        end        
        true
    end
    def my_any? #5
        self.my_each do |val|
            return true if yield(val)
        end        
        false
    end
    def my_none? #6
        self.my_each do |val|
            return false if yield(val)
        end        
        true
    end

    def my_count #7
        i = 0
        i += 1 while(self[i]) 
        i
    end

    def my_map
        #Why does this method works with procs and blocks without changing it? 
        for i in 0...self.my_count do
            self[i] = yield(self[i]) 
        end
    end

    def my_inject
        acc = self[0]
        for i in 1...self.my_count do
            acc = yield(acc,self[i])
        end       
        return acc
    end           
end

def multiply(array = [])    
    array.my_inject{ |acc,val|
        acc *= val
    }   
end

enumerable= [2,3,4]
puts multiply(enumerable)



# sum = enumerable.inject{ |sum,val|
#     sum += val
# }
# puts sum
# enumerable.each{|x| puts x}