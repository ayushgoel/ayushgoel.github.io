---
tags: ruby access-control
---
While working on Matasano crypto challenges, I reached a stage where I could reuse the functions I had written in previous exercises.

So let’s suppose I had a function `foo` in 1.rb

{% highlight ruby linenos %}

def foo
  "foo"
end

{% endhighlight %}

I need the function `foo` in my second script named `2.rb`

{% highlight ruby linenos %}

require_relative "1"

def main
  puts 1.x
end

main if __FILE__ == $0

{% endhighlight %}

Running the script 2.rb on terminal gives me the error

{% highlight bash linenos %}

$ ruby 2.rb 
2.rb:5:in `main': undefined method `foo’ for 1:Fixnum (NoMethodError)
	from 2.rb:8:in `<main>'

{% endhighlight %}

This lead me to learning [ruby access controls](http://rubylearning.com/satishtalim/ruby_access_control.html).
So the top level methods are `private` by default and belong to `self` which is a direct instance of `Object` itself. This means we can never call these methods with an `explicit receiver`.
In this case, `1` is an `explicit receiver` which has been imported in `2.rb`.

The not-so-good solution I have found for the time being is to mark the required top level function public explicitly.

{% highlight ruby linenos %}

public
def foo
  "foo"
end

{% endhighlight %}

The possible solution might be to use modules, but I am yet to reach that state.
