include("Grid.jl")


function count_neighbors(grid::Grid, row::Int, col::Int)
    rows, cols = size(grid.data)
    count = 0
    for i in -1:1
        for j in -1:1
            if i == 0 && j == 0
                continue
            end
            neighbor_row = row + i
            neighbor_col = col + j
            if neighbor_row < 1 || neighbor_row > rows || neighbor_col < 1 || neighbor_col > cols
                continue
            end
            if get_cell(grid, neighbor_row, neighbor_col)
                count += 1
            end
        end
    end
    return count
end

function evolve(grid::Grid)
    rows, cols = size(grid.data)
    new_grid = create_grid(rows, cols, false)
    for row in 1:rows
        for col in 1:cols
            neighbors = count_neighbors(grid, row, col)
            if get_cell(grid, row, col)
                if neighbors == 2 || neighbors == 3
                    set_cell!(new_grid, row, col, true)
                end
            else
                if neighbors == 3
                    set_cell!(new_grid, row, col, true)
                end
            end
        end
    end
    return new_grid
end