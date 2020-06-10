module Strings exposing (initialText)


initialText =
    """

*You are looking at an editor for an extended version of Markdown. Feel free to edit the text or clear it entirely and experiment.*

[Github repo](https://github.com/jxxcarlson/markdown-demo)

# Extended Markdown

This document describes an extended version of Markdown provided by the package
[jxxcarlson//elm-markdown](https://package.elm-lang.org/packages/jxxcarlson/elm-markdown/latest/).
Extended Markdown can
render both mathematical formulas written in LaTeX as well as
SVG images, can handle verbatim text, format poetry, etc.  These features are described below.




## Examples

### 1 Inline math:

Pythagoras said that $a^2 + b^2 = c^2$.

### 2 Display math

$$
    \\int_0^1 x^n dx = \\frac{1}{n + 1}
$$


### 3. SVG and custom blocks

Extended Markdown has special block syntax
as illustrated in the example below:

````
@svg
<svg width="300" height="100">
<circle cx="200" cy="50" r="40"
stroke="blue" stroke-width="3"
fill="cyan" />
</svg>
````

In the case at hand, this block is rendered
as an image:

@svg
<svg width="300" height="100">
<circle cx="200" cy="50" r="40"
stroke="blue" stroke-width="3"
fill="cyan" />
</svg>

It is an easy matter to add new blocks of this kind.
They have form

````
    @block-name arg1 arg2 ...
    body
````

where the block-name is followed by a possibly empty
list of arguments and the body is possibly empty
set on non-blank lines terminated by a blank line

### 4 Colors and custom inline elements

One can use colors, as in the examples
below.

> This is a @class[blue test], but
if something should go wrong, you
will receive a @class[red warning]. The
color @class[green green] is also available.

The syntax is as in this example:

````
    @class[red warning]
````

Any class name is OK, but you must define the class
in `./public/assets/style.css`.  More generally,
you can easily add new inline elements of the form
`@element-name[arg1 arg2 ... ]`

### 5 Images

By default, with the usual Markdown syntax,
images are scaled to occupy the full
width of the page, as in the example below.

![Robin](http://noteimages.s3.amazonaws.com/robin2.jpg)

There are three alternative formatting choices:

````
    ![Robin::center](URL)
    ![Robin::left](URL)
    ![Robin::right](URL)
````

### 6 Code

```elm
setArea : Float -> Organism -> Organism
setArea a organism  =
   map (\\r -> {r | area =  a}) organism
```
### 7 Poetry

>> 'Twas brillig, and the slithy toves
   Did gyre and gimble in the wabe;
   All mimsy were the borogoves,
   And the mome raths outgrabe.

>>   "Beware the Jabberwock, my son!
   The jaws that bite, the claws that catch!
   Beware the Jubjub bird, and shun
   The frumious Bandersnatch!"
    
 """
