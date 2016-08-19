Notes about indentation:

We talked a lot about indentation at this meetup. White space is important in Haskell as it is usually the only indicator of function application, for one thing, and the parser can be persnickety about indentation.

However, we talked about four keywords that signal to the parser that things should be indented:

```haskell
where
of
let
do
```

The things that come under that and are considered part of the expression opened by that keyword should be indented to the same level, but exactly how far they are indented is not important. 

So, for example, when you write the `do` for a `do`-block, that signals that whatever comes underneath it should be indented to the same level (unless there is further nesting, such as when a case expression [uses keyword `of`]) or a `let` expression or a nested `do`, for example) but it doesn't matter exactly how many spaces you choose to have it nested, as long as they line up.

Similarly, when you write the `module Main where` line at the top of a source file, the `where` introduces a block in which all the top-level (not nested inside something else) declarations and expressions have to start at the same column. It doesn't matter that it be the leftmost column, although that is normal.

Please, whoever remembers more details from this discussion or has something to add to it, PR this because I think this is very valuable information. Many thanks to Sooraj (whose name I might have misspelled, but I think that's right, and I don't even know his last name *sigh*). I hadn't ever seen anyone generalize the rule this well, and parse errors give me massive headaches.