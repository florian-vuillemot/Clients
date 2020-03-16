using Test
using Dates

using Clients


@testset "Client" begin
    @testset "Constructor" begin
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
    end
end;


@testset "Horse Owner" begin
    name = "foo"

    @testset "Constructor" begin
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
            horses = Set{Int}(1:nbhorses)

            horseowner = Clients.HorseOwner{Int}(name, dateofbirthday, horses)

            @test horseowner.name == name
            @test horseowner.dateofbirthday == dateofbirthday
            @test length(horseowner.horses) == nbhorses
        end
    end

    @testset "Update number of Horses" begin
        @testset "Add one horse" begin
            horseowner = Clients.HorseOwner{Int}(name)

            Clients.addhorse!(horseowner, 42)
            @test length(horseowner.horses) == 1
        end

        @testset "Add multiple horse horse" begin
            horseowner = Clients.HorseOwner{Int}(name)

            Clients.addhorse!(horseowner, 42)
            Clients.addhorse!(horseowner, 84)
            @test length(horseowner.horses) == 2
        end

        @testset "Add multiple horse horse in once" begin
            horseowner = Clients.HorseOwner{Int}(name)

            Clients.addhorses!(horseowner, [42, 84])
            @test length(horseowner.horses) == 2
        end

        @testset "Add only once same Horse" begin
            horseowner = Clients.HorseOwner{Int}(name)

            Clients.addhorses!(horseowner, [42, 42])
            @test length(horseowner.horses) == 1
        end
    end
end
