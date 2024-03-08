type coord = int * int 
type 'a grid = { 
  data: 'a array array; 
  rows: int; 
  cols: int}

let create_grid rows cols initial_value = 
  let data = Array.make_matrix rows cols initial_value in
  {data; rows; cols}

let get_cell { data; _ } (row, col) = 
  data.(row).(col)

let set_cell grid (row, col) value = 
  let data = Array.copy grid.data in
  data.(row).(col) <- value;
  {grid with data}

let map_grid f { data; rows; cols} =
  let new_data = Array.make_matrix rows cols (f data.(0).(0)) in
  for row = 0 to rows - 1 do
    for col = 0 to cols - 1 do
      new_data.(row).(col) <- f data.(row).(col)
    done
  done;
  {data = new_data; rows; cols}

