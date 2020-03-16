module Clients

using Dates


"""
    Client{Horse}(name)

A client with horse(s)
"""
struct Client{Horse}
    name::String
    dateofbirthday::Union{Date, Nothing}
    horses::Set{Horse}

    Client{Horse}(name; dateofbirthday=nothing, horses=Set{Horse}()) where {Horse} = new(name, dateofbirthday, horses)
end

function addhorses!(owner::Client, horses::Vector{Horse})::Client where Horse
    map(horse -> addhorse!(owner, horse), horses)
    owner
end

function addhorse!(owner::Client, horse::Horse)::Client where Horse
    push!(owner.horses, horse)
    owner
end

function removehorses!(owner::Client, horses::Vector{Horse})::Client where Horse
    map(horse -> removehorse!(owner, horse), horses)
    owner
end

function removehorse!(owner::Client, horse::Horse)::Client where Horse
    delete!(owner.horses, horse)
    owner
end

end