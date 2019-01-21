val ( <| ) : ('a -> 'b) -> 'a -> 'b

val ( >> ) : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

val ( << ) : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c

val identity : 'a -> 'a

module List : sig
  val flatten : 'a list list -> 'a list

  val sum : int list -> int

  val floatSum : float list -> float

  val map : f:('a -> 'b) -> 'a list -> 'b list

  val indexedMap : f:(int -> 'a -> 'b) -> 'a list -> 'b list

  val map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list

  val getBy : f:('a -> bool) -> 'a list -> 'a option

  val elemIndex : value:int -> int list -> int option

  val last : 'a list -> 'a option

  val member : value:'a -> 'a list -> bool

  val uniqueBy : f:('a -> string) -> 'a list -> 'a list

  val find : f:('a -> bool) -> 'a list -> 'a option

  val getAt : index:int -> 'a list -> 'a option

  val any : f:('a -> bool) -> 'a list -> bool

  val head : 'a list -> 'a option

  val drop : count:int -> 'a list -> 'a list

  val init : 'a list -> 'a list option

  val filterMap : f:('a -> 'b option) -> 'a list -> 'b list

  val filter : f:('a -> bool) -> 'a list -> 'a list

  val concat : 'a list list -> 'a list

  val partition : f:('a -> bool) -> 'a list -> 'a list * 'a list

  val foldr : f:('a -> 'b -> 'b) -> init:'b -> 'a list -> 'b

  val foldl : f:('a -> 'b -> 'b) -> init:'b -> 'a list -> 'b

  val findIndexHelp : int -> predicate:('a -> bool) -> 'a list -> int option

  val findIndex : f:('a -> bool) -> 'a list -> int option

  val take : count:int -> 'a list -> 'a list

  val updateAt : index:int -> f:('a -> 'a) -> 'a list -> 'a list

  val length : 'a list -> int

  val reverse : 'a list -> 'a list

  val dropWhile : f:('a -> bool) -> 'a list -> 'a list

  val isEmpty : 'a list -> bool

  val cons : 'a -> 'a list -> 'a list

  val takeWhile : f:('a -> bool) -> 'a list -> 'a list

  val all : f:('a -> bool) -> 'a list -> bool

  val tail : 'a list -> 'a list option

  val append : 'a list -> 'a list -> 'a list

  val removeAt : index:int -> 'a list -> 'a list

  val minimumBy : f:('a -> 'comparable) -> 'a list -> 'a option

  val maximumBy : f:('a -> 'comparable) -> 'a list -> 'a option

  val maximum : list:'comparable list -> 'comparable option

  val sortBy : f:('a -> 'b) -> 'a list -> 'a list

  val span : f:('a -> bool) -> 'a list -> 'a list * 'a list

  val groupWhile : f:('a -> 'a -> bool) -> 'a list -> 'a list list

  val splitAt : index:int -> 'a list -> 'a list * 'a list

  val insertAt : index:int -> value:'a -> 'a list -> 'a list

  val splitWhen : f:('a -> bool) -> 'a list -> ('a list * 'a list) option

  val intersperse : 'a -> 'a list -> 'a list

  val initialize : int -> (int -> 'a) -> 'a list

  val sortWith : ('a -> 'a -> int) -> 'a list -> 'a list

  val iter : f:('a -> unit) -> 'a list -> unit

  val for_all2_exn : 'a list -> 'b list -> ('a -> 'b -> bool) -> bool

  val mapi : (int -> 'a -> 'b) -> 'a list -> 'b list
end

module Result : sig
  type ('err, 'ok) t

  val withDefault : default:'ok -> ('err, 'ok) t -> 'ok

  val map2 : f:('a -> 'b -> 'c) -> ('err, 'a) t -> ('err, 'b) t -> ('err, 'c) t

  val combine : ('x, 'a) t list -> ('x, 'a list) t

  val map : ('ok -> 'value) -> ('err, 'ok) t -> ('err, 'value) t

  val toOption : ('err, 'ok) t -> 'ok option

  val pp :
       (Format.formatter -> 'err -> unit)
    -> (Format.formatter -> 'ok -> unit)
    -> Format.formatter
    -> ('err, 'ok) t
    -> unit
end

module Option : sig
  type 'a t = 'a option

  val andThen : ('a -> 'b option) -> 'a option -> 'b option

  val or_ : 'a option -> 'a option -> 'a option

  val orElse : 'a option -> 'a option -> 'a option

  val map : ('a -> 'b) -> 'a option -> 'b option

  val withDefault : default:'a -> 'a option -> 'a

  val foldrValues : 'a option -> 'a list -> 'a list

  val values : 'a option list -> 'a list

  val toList : 'a option -> 'a list

  val isSome : 'a option -> bool
end

module Char : sig
  val toCode : char -> int

  val fromCode : int -> char
end

module Tuple2 : sig
  val mapSecond : ('b -> 'c) -> 'a * 'b -> 'a * 'c

  val second : 'a * 'b -> 'b

  val first : 'a * 'b -> 'a

  val create : 'a -> 'b -> 'a * 'b
end

module String : sig
  val length : string -> int

  val toInt : string -> (string, int) Result.t

  val toFloat : string -> (string, float) Result.t

  val uncons : string -> (char * string) option

  (* Drop ~count characters from the beginning of a string. *)
  val dropLeft : count:int -> string -> string

  (* Drop ~count characters from the end of a string. *)
  val dropRight : count:int -> string -> string

  val split : on:string -> string -> string list

  val join : sep:string -> string list -> string

  val endsWith : suffix:string -> string -> bool

  val startsWith : prefix:string -> string -> bool

  val toLower : string -> string

  val toUpper : string -> string

  val uncapitalize : string -> string

  val capitalize : string -> string

  val isCapitalized : string -> bool

  val contains : substring:string -> string -> bool

  val repeat : count:int -> string -> string

  val fromList : char list -> string

  val toList : string -> char list

  val fromInt : int -> string

  val concat : string list -> string

  val fromChar : char -> string

  val slice : from:int -> to_:int -> string -> string

  val trim : string -> string

  val insertAt : insert:string -> index:int -> string -> string
end

module IntSet : sig
  type t

  type value

  val fromList : value list -> t

  val member : value:value -> t -> bool

  val diff : t -> t -> t

  val isEmpty : t -> bool

  val toList : t -> value list

  val ofList : value list -> t

  val add : t -> value -> t

  val union : t -> t -> t

  val empty : t
end

module StrSet : sig
  type t

  type value

  val fromList : value list -> t

  val member : value:value -> t -> bool

  val diff : t -> t -> t

  val isEmpty : t -> bool

  val toList : t -> value list

  val ofList : value list -> t

  val add : t -> value -> t

  val union : t -> t -> t

  val empty : t
end

module StrDict : sig
  type key

  type 'value t

  val toList : 'a t -> (key * 'a) list

  val empty : 'a t

  (* If there are multiple list items with the same key, the last one wins *)
  val fromList : (key * 'value) list -> 'value t

  val get : key:key -> 'value t -> 'value option

  val insert : key:key -> value:'value -> 'value t -> 'value t

  val keys : 'a t -> key list

  val update :
    key:key -> f:('value option -> 'value option) -> 'value t -> 'value t

  val map : 'a t -> f:('a -> 'b) -> 'b t
end

module IntDict : sig
  type key

  type 'value t

  val toList : 'a t -> (key * 'a) list

  val empty : 'a t

  val fromList : (key * 'value) list -> 'value t

  val get : key:key -> 'value t -> 'value option

  val insert : key:key -> value:'value -> 'value t -> 'value t

  val update :
    key:key -> f:('value option -> 'value option) -> 'value t -> 'value t

  val keys : 'a t -> key list

  val map : 'a t -> f:('a -> 'b) -> 'b t
end