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
