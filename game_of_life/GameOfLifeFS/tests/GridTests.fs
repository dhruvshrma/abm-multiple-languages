// tests/GridTests.fs
namespace GameOfLife.Tests

open NUnit.Framework
open GameOfLife.Grid

[<TestFixture>]
type GridTests() =

    [<Test>]
    member this.``Create grid with correct dimensions``() =
        let grid = createGrid 3 4 false
        Assert.AreEqual(grid.Rows, 2)
        Assert.AreEqual(grid.Cols, 4)

    [<Test>]
    member this.``Get cell value``() =
        let grid = createGrid 3 4 false
        Assert.AreEqual(getCell grid (1, 2), false)

    [<Test>]
    member this.``Set cell value``() =
        let grid = createGrid 3 4 false
        let newGrid = setCell grid (1, 2) true
        Assert.AreEqual(getCell newGrid (1, 2), true)

    [<Test>]
    member this.``Map function over grid``() =
        let grid = createGrid 3 4 false
        let newGrid = mapGrid (fun x -> not x) grid
        Assert.AreEqual(getCell newGrid (1, 2), true)