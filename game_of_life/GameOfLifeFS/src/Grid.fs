// src/Grid.fs
type Coord = int * int
type Grid<'a> = { Data: 'a[,]; Rows: int; Cols: int }

let createGrid rows cols initialValue =
    let data = Array2D.create rows cols initialValue
    { Data = data; Rows = rows; Cols = cols }

let getCell (grid: Grid<'a>) (row, col) = grid.Data.[row, col]

let setCell (grid: Grid<'a>) (row, col) value =
    let data = Array2D.copy grid.Data
    data.[row, col] <- value
    { grid with Data = data }

let mapGrid f (grid: Grid<'a>) =
    let data = Array2D.mapi (fun row col value -> f value) grid.Data
    { Data = data; Rows = grid.Rows; Cols = grid.Cols }