#!/usr/bin/env julia

include("Grid.jl")
include("Rules.jl")


function run_simulation(rows::Int, cols::Int, generations::Int)
    grid = create_grid(rows, cols, false)
    for row in 1:rows
        for col in 1:cols
            set_cell!(grid, row, col, rand(Bool))
        end
    end
    for generation in 1:generations
        grid = evolve(grid)
        println("Generation: $generation")
        visualize(grid)
        sleep(0.5)
    end
end

function visualize(grid::Grid)
    rows, cols = size(grid.data)
    for row in 1:rows
        for col in 1:cols
            if get_cell(grid, row, col)
                print("⬛")
            else
                print("⬜")
            end
        end
        println()
    end
    println()
end

if abspath(PROGRAM_FILE) == @__FILE__
    if length(ARGS) != 3
        println("Usage: julia GameOfLife.jl <rows> <cols> <generations>")
        exit(1)
    end
    rows = parse(Int, ARGS[1])
    cols = parse(Int, ARGS[2])
    generations = parse(Int, ARGS[3])
    run_simulation(rows, cols, generations)
end