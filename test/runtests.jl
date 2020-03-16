using Test
using Dates

using Clients


@testset "Create Client" begin
    name = "foo"

    @testset "From name" begin
        client = Clients.Client(name)

        @test client.name == name
        @test client.dateofbirthday == nothing
    end

    @testset "With all parameters" begin
        dateofbirthday = Date(2019)
        client = Clients.Client(name, dateofbirthday)

        @test client.name == name
        @test client.dateofbirthday == dateofbirthday
    end
end;


@testset "Create a Horse Owner" begin
    name = "foo"


    @testset "From name" begin
        horseowner = Clients.HorseOwner{Int}(name)

        @test horseowner.name == name
        @test horseowner.dateofbirthday == nothing
        @test length(horseowner.horses) == 0
    end

    @testset "With birthday" begin
        dateofbirthday = Date(2019)

        horseowner = Clients.HorseOwner{Int}(name, dateofbirthday)

        @test horseowner.name == name
        @test horseowner.dateofbirthday == dateofbirthday
        @test length(horseowner.horses) == 0
    end

    @testset "With Horses" begin
        nbhorses = 5
        dateofbirthday = Date(2019)
        horses = Vector{Int}(1:nbhorses)

        horseowner = Clients.HorseOwner{Int}(name, dateofbirthday, horses)

        @test horseowner.name == name
        @test horseowner.dateofbirthday == dateofbirthday
        @test length(horseowner.horses) == nbhorses
    end
end
