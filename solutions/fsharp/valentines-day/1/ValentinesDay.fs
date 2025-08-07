module ValentinesDay

// TODO: please define the 'Approval' discriminated union type
type Approval=
  | Yes
  | No
  | Maybe

// TODO: please define the 'Cuisine' discriminated union type
type Cuisine = 
  | Korean
  | Turkish

// TODO: please define the 'Genre' discriminated union type
type Genre = 
  | Crime
  | Horror
  | Romance
  | Thriller

// TODO: please define the 'Activity' discriminated union type
type Activity =
  | BoardGame
  | Chill
  | Movie of Genre
  | Restaurant of Cuisine
  | Walk of int

let rateActivity (activity: Activity): Approval = 
  match activity with
  | BoardGame -> No
  | Chill -> No
  | Movie genre -> if genre = Romance then Yes else No
  | Restaurant cuisine -> 
    match cuisine with
    | Korean -> Yes
    | Turkish -> Maybe
  | Walk km -> if km < 3 then Yes elif km < 5 then Maybe else No