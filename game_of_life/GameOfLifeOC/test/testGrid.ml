open OUnit2
open Grid

let tests = "Grid" >::: [
  "create_grid" >:: (
    fun _ ->
      let grid = create_grid 3 4 false in
      assert_equal grid.rows 3;
  );
]
