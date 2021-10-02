def get_addresses
    #using  includes will solve the N+1 query problem
    User.includes(:adress).map { |user| user.address if  user.address&.city.present? } 
end

#if there is limit of passing number of arguments
def sum(x=0,y=0,z=0,w=0)
  x+y+z+w
end

#if there is no limit of passing number of arguments
def total_sum(*args)
    args.sum
end

class Greeting
  attr_accessor :name
end