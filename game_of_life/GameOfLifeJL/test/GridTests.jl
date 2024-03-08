using Test

include("../src/Grid.jl")

@testset "Grid" begin
    @testset "create grid" begin
        grid = create_grid(3,4,false)
        @test size(grid.data) == (3,4)
    end

    @testset "get_cell" begin
        grid = create_grid(3,4,false)
        @test get_cell(grid, 1, 1) == false
        @test get_cell(grid, 2, 3) == false
    end

    @testset "set_cell" begin
        grid = create_grid(3,4,false)
        set_cell!(grid, 1, 1, true)
        @test get_cell(grid, 1, 1) == true
        set_cell!(grid, 2, 3, true)
        @test get_cell(grid, 2, 3) == true
    end

    @testset "map_grid" begin
        grid = create_grid(3,4,false)
        map_grid!(x -> !x, grid)
        # @test get_cell(grid, 1, 1) == true
        # @test get_cell(grid, 2, 3) == false
        @test all( x-> x == true, grid.data)
    end
end