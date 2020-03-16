using Test
using Dates

using Clients


name = "foo"

@testset "Constructor" begin
    @testset "From name" begin
        client = Clients.Client{Int}(name)

        @test client.name == name
        @test client.dateofbirthday == nothing
        @test length(client.horses) == 0
    end

    @testset "With birthday" begin
        dateofbirthday = Date(2019)

        client = Clients.Client{Int}(name; dateofbirthday=dateofbirthday)

        @test client.name == name
        @test client.dateofbirthday == dateofbirthday
        @test length(client.horses) == 0
    end

    @testset "With Horses" begin
        nbhorses = 5
        dateofbirthday = Date(2019)
        horses = Set{Int}(1:nbhorses)

        client = Clients.Client{Int}(name; dateofbirthday=dateofbirthday, horses=horses)

        @test client.name == name
        @test client.dateofbirthday == dateofbirthday
        @test length(client.horses) == nbhorses
    end
end

@testset "Add Horse(s)" begin
    @testset "One" begin
        client = Clients.Client{Int}(name)

        Clients.addhorse!(client, 42)
        @test length(client.horses) == 1
    end

    @testset "Multiple" begin
        client = Clients.Client{Int}(name)

        Clients.addhorse!(client, 42)
        Clients.addhorse!(client, 84)
        @test length(client.horses) == 2
    end

    @testset "Multiple in once" begin
        client = Clients.Client{Int}(name)

        Clients.addhorses!(client, [42, 84])
        @test length(client.horses) == 2
    end

    @testset "Ensure no double" begin
        client = Clients.Client{Int}(name)

        Clients.addhorses!(client, [42, 42])
        @test length(client.horses) == 1
    end
end

@testset "Remove horse(s)" begin
    @testset "One" begin
        horses = Set{Int}([42, 84])
        client = Clients.Client{Int}(name; horses=horses)

        Clients.removehorse!(client, 42)
        @test length(client.horses) == 1
    end

    @testset "Multiple" begin
        horses = [42, 84]
        client = Clients.Client{Int}(name; horses=Set{Int}(horses))

        Clients.removehorses!(client, horses)
        @test length(client.horses) == 0
    end

    @testset "Not found" begin
        horses = Set{Int}([42, 84])
        client = Clients.Client{Int}(name; horses=horses)

        Clients.removehorse!(client, 0)
        @test length(client.horses) == 2
    end
end
