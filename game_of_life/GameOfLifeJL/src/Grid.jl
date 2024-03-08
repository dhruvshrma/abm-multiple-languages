mutable struct Grid{T}
    data::Matrix{T}
end 

function create_grid(rows::Int, cols::Int, initial_value::Bool) 
    return Grid(fill(initial_value, (rows, cols)))
end 

function get_cell(grid::Grid, row::Int, col::Int)
    return grid.data[row, col]
end

function set_cell!(grid::Grid, row::Int, col::Int, value)
    grid.data[row, col] = value
end

function map_grid!(f, grid::Grid)
    grid.data = f.(grid.data)
end
