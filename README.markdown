TITLE CASE
===

A port of John Gruber's title casing script to Ruby.
2008-05-21 Jim Lindley http://jimlindley.com

http://github.com/jlindley/titlecase

Original Perl Source: http://daringfireball.net/projects/titlecase/TitleCase.pl

This filter changes all words to Title Caps, and attempts to be clever
about *un*capitalizing small words like a/an/the in the input.

The list of "small words" which are not capped comes from
the New York Times Manual of Style, plus 'vs' and 'v'. 

John Gruber
http://daringfireball.net/
10 May 2008

INSTALL:
---

Download the tarball for now, will be mirrored to ruby forge shortly.


USAGE
---

Either create a new instance of TitleClass with the string as an argument, or use the monkeypatched #titlecase method on string objects.

    require 'rubygems'
    require 'titlecase'
    TitleCase.new("my little string").to_s #=> "My Little String"
    "a boat, a duck: a bit too much".titlecase #=> "A Boat, a Duck: A Bit Too Much"

LICENSE:
---

(The MIT License)

Copyright (c) 2008 John Gruber, Jim Lindley

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.