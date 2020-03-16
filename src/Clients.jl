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

    Client(name, dateofbirthday=nothing) = new(name, dateofbirthday)
end


"""
    HorseOwner{Horse}(name)

A client with horse(s)
"""
struct HorseOwner{Horse} <: Person
    name::String
    dateofbirthday::Union{Date, Nothing}
    horses::Vector{Horse}

    HorseOwner{Horse}(name, dateofbirthday=nothing, horses=Vector{Horse}()) where {Horse} = new(name, dateofbirthday, horses)
end

end