module Clients

using Dates


"""
    Person(name, dateofbirthday)

Information from a person that evolve in the stable
"""
abstract type Person end


"""
    Client(name, dateofbirthday)

Implementation of Person
"""
struct Client <: Person
    name::String
    dateofbirthday::Union{Date, Nothing}

    Client(name) = new(name, nothing)
    Client(name, dateofbirthday) = new(name, dateofbirthday)
end


struct HorseOwner{Horse} <: Person
    name::String
    dateofbirthday::Union{Date, Nothing}
    horses::Vector{Horse}
end

end