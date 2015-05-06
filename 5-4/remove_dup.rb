# Remove dup

array = [1, 2, 3, 4, 4, 3, 2, 1, 1]

def remove_dup(array)
  a = []
  array.each do |x|
    a.push(x) unless a.include?(x)
   end
  a
end  

print remove_dup(array)