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

    Client(name; dateofbirthday=nothing) = new(name, dateofbirthday)
end


"""
    HorseOwner{Horse}(name)

A client with horse(s)
"""
struct HorseOwner{Horse} <: Person
    name::String
    dateofbirthday::Union{Date, Nothing}
    horses::Set{Horse}

    HorseOwner{Horse}(name; dateofbirthday=nothing, horses=Set{Horse}()) where {Horse} = new(name, dateofbirthday, horses)
end

function addhorses!(owner::HorseOwner, horses::Vector{Horse})::HorseOwner where Horse
    map(horse -> addhorse!(owner, horse), horses)
    owner
end

function addhorse!(owner::HorseOwner, horse::Horse)::HorseOwner where Horse
    push!(owner.horses, horse)
    owner
end

function removehorses!(owner::HorseOwner, horses::Vector{Horse})::HorseOwner where Horse
    map(horse -> removehorse!(owner, horse), horses)
    owner
end

function removehorse!(owner::HorseOwner, horse::Horse)::HorseOwner where Horse
    delete!(owner.horses, horse)
    owner
end

end