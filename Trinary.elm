module Trinary exposing (..)

{-|
Trinary logic using `T`, `M`, `F` for `True`, `Maybe`, `False`.
Infixes are prefixed with `#` because `Shift + 3`.

# Definition
@docs Trit

# Logic
@docs not, and, or, implies, eq

# Infixes
@docs (#!), (#&), (#|), (#>), (#=)
-}


{-| Trinary logic has three truth values. The first letter is used
because `True` and `False` are reserved and `Maybe` is a default
import.
-}
type Trit
    = T
    | M
    | F


{-|
```
| ¬             |
| ------------- |
| True  | False |
| Maybe | Maybe |
| False | True  |
```
-}
not : Trit -> Trit
not t =
    case t of
        T ->
            F

        F ->
            T

        _ ->
            M


{-|
```
| ∧     | True  | Maybe | False |
| ----- | ----- | ----- | ----- |
| True  | True  | Maybe | False |
| Maybe | Maybe | Maybe | False |
| False | False | False | False |
```
-}
and : Trit -> Trit -> Trit
and t u =
    case ( t, u ) of
        ( T, T ) ->
            T

        ( F, _ ) ->
            F

        ( _, F ) ->
            F

        _ ->
            M


{-|
```
| ∨     | True | Maybe | False |
| ----- | ---- | ----- | ----- |
| True  | True | True  | True  |
| Maybe | True | Maybe | Maybe |
| False | True | Maybe | False |
```
-}
or : Trit -> Trit -> Trit
or t u =
    case ( t, u ) of
        ( F, F ) ->
            F

        ( T, _ ) ->
            T

        ( _, T ) ->
            T

        _ ->
            M


{-|
```
| ⊃     | True | Maybe | False |
|------ | ---- | ----- |------ |
| True  | True | Maybe | False |
| Maybe | True | Maybe | Maybe |
| False | True | True  | True  |
```
-}
implies : Trit -> Trit -> Trit
implies t u =
    case ( t, u ) of
        ( T, F ) ->
            F

        ( F, _ ) ->
            T

        ( _, T ) ->
            T

        _ ->
            M


{-|
```
| ≡     | True  | Maybe | False |
| ----- | ----- | ----- | ----- |
| True  | True  | Maybe | False |
| Maybe | Maybe | Maybe | Maybe |
| False | False | Maybe | True  |
```
-}
eq : Trit -> Trit -> Trit
eq t u =
    case ( t, u ) of
        ( T, T ) ->
            T

        ( F, F ) ->
            T

        ( T, F ) ->
            F

        ( F, T ) ->
            F

        _ ->
            M


{-| Infix for `not`
-}
(#!) : Trit -> Trit
(#!) =
    not
infixl 2 #!


{-| Infix for `and`
-}
(#&) : Trit -> Trit -> Trit
(#&) =
    and
infixl 2 #&


{-| Infix for `or`
-}
(#|) : Trit -> Trit -> Trit
(#|) =
    or
infixl 2 #|


{-| Infix for `implies`
-}
(#>) : Trit -> Trit -> Trit
(#>) =
    implies
infixl 2 #>


{-| Infix for `eq`
-}
(#=) : Trit -> Trit -> Trit
(#=) =
    eq
infixl 2 #=
