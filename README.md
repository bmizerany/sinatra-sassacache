Sinatra Sassacache
========================

Extends [Sinatra](http://www.sinatrarb.com/) with a route for
compiling and serving sass templates to be cached by an
HTTP cache proxy.

You can Install the `sinatra-sassacache` with rip

    $ rip install git://github.com/bmizerany/sinatra-sassacache.git

or
    $ gem install sinatra-sassacache -s http://gemcutter.org

or
    $ gem install bmizerany-sinatra-sassacache -s http://gems.github.com

and use like:

    $ vim sinatra-using-sassacache.rb

in-file-template example:

    require 'sinatra'
    require 'sinatra/sassacache'

    __END__

    @@ foo_stylesheet
    #foo
      :color red

See more about views in the Sinatra [README](http://www.sinatrarb.com/intro.html)

run it!
    $ ruby sinatra-using-sassacache.rb

see!
    $ curl http://localhost:4567/foo_template.css

## Configure

The max-age value in the header, set by sassacache, defaults to 1 month.
You can set it to whatever you like:

    set :sassacache_max_age, 99 # 99 Seconds

### Sass Reference Material

  * The [Haml/Sass docs](http://haml-lang.com/docs/yardoc/)

### NOTE about the rip-off

  This Code and README.md is a heavy adaption of [rtomayko's sinatra-sequel](http://github.com/rtomayko/sinatra-sequel/)

# LICENSE

Copyright (c) 2009 Blake Mizerany

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
