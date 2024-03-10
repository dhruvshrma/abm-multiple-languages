using Test
include("../src/Rules.jl")

@testset "Rules" begin
    @testset "count_neighbors" begin
        grid = create_grid(3, 3, false)
        set_cell!(grid, 1, 1, true)
        set_cell!(grid, 1, 2, true)
        set_cell!(grid, 2, 1, true)
        @test count_neighbors(grid, 1, 1) == 2
        @test count_neighbors(grid, 2, 2) == 3
        @test count_neighbors(grid, 3, 3) == 0
    end

    @testset "evolve" begin
        grid = create_grid(3, 3, false)
        set_cell!(grid, 1, 1, true)
        set_cell!(grid, 1, 2, true)
        set_cell!(grid, 2, 1, true)
        new_grid = evolve(grid)
        @test get_cell(new_grid, 1, 1) == true
        @test get_cell(new_grid, 1, 2) == true
        @test get_cell(new_grid, 2, 1) == true
        @test get_cell(new_grid, 2, 2) == true
    end
end