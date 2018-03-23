
# internal helper stuff for handling pattern matching

SimplePattern = Union{Regex,AbstractString,Function}
Pattern = Union{SimplePattern, AbstractArray}


matchany(p::Regex, s::AbstractString) = ismatch(p,s)
matchany(p::AbstractString, s::AbstractString) = ismatch(Regex(p),s)
matchany(p::Function, s::AbstractString) = p(s)

matchany(p::AbstractArray, s::AbstractString) = any(x->ismatch(x,s),p)

matchany(p::Pattern, s::AbstractArray) = map!(x->matchany(p,x),BitArray(size(s)),s)


