# My-Vimrc

Preface
=======
This is my personal .vimrc with instructions on how to
install each plugin, as well as some basic usage instructions
that should get you started on using these fantastic plugins.

Installation
============
Any plugin not listed here is just installed using your favorite package manager
(Vundle/Pathogen/whatever)

Syntastic
---------

Solarized
---------

Phpcomplete
-----------

Neocomplete
-----------

Airline
-------

Usage
=====
>Work in progresss, going to write these in order of usefullness (in my personal opinion)
Legend
------
&lt;Leader&gt; = \

Easymotion
----------
Easymotion is amongst my favorite plugins, its keybindings allow for incredibly
quick and easy movement through files, and also vastly improves the search function.

The bindings used in my vimrc aren't included by default. In fact, by default easymotion
only has a few basic keybindings which, frankly, aren't too useful. Essentially,
these default keybindings make it so that you can jump to the first letter of any word
either forward (\\w) or backward(\\b) as well as any instance of a single letter (\\s).
Now, the reason I'm going over this is because understanding the way easymotion jumps work
is key to making good use of this plugin. When you perform one of the keybinding, in this 
example we'll say \\w, all text in the file will be grayed out, except for any matches to
the binding. Instead of being grayed out, they will be overlayed with either a letter or a 
combination of a letter/special character and a letter. Pressing on the matching letter/combination
will cause an instant jump to the matching pair.

Now that that exhaustive explanation is over, let's get to the meat and potatoes. The first non-default
keybindings I'm going to talk about are the \(h,j,k,l) bindings. Now these perform essentially the same
function as \\w or \\b, except they do it in a specific direction. This isn't super useful for \k or \j,
since that's \\w and \\b anyways, but for \h and \l these allow one to jump to any position in the current line.
This greatly reduces the amount of time you spend trying to narrow in on a specific word to edit.

My bindings also overwrite the default search function to use the one provided by easymotion. In every sense
of the word, the easymotion search is superior. For starters, it automatically highlights all matches as you're typing
and provides the same jumping motions provided by the previous bindings. I have also modified the search function
to use smartcase.

Ctrlp
-----
Control p is another amazing plugin. It uses what is called fuzzy searching. Admittedly, I haven't done
a ton of research into exactly how it works, but from my understanding it essentially turns your search
into a regex where there is a . (match 0 or more of any character) inserted between each letter you type.
This search is then performed (live I might add) on the PATH of all files in your directory. Essentially,
this means that as long as you know the path and filename of the file you wish to open, you could get away with
typing almost nothing and still get the right file. For instance, say you have a file foo.bar and it's in the directory
foo/bar/foobar. All you would have to type *at most* is fbff.b and it would get your file. It should be noted, however,
that depending on the file structure of your project, you may have to be more specific. This gets especially problematic
when dealing with files that are automatically generated with alphanumeric characters and similiarly named paths,
however in the former case you can create ignores for controlp so it would only search relevant directories.

Control p also features an MRU (most recently used) and buffer search, but I haven't used these much as the
file search is fast enough. It also allows for the creation of files, but I don't use it for this as you have
to type the full path and it's easier to create files using NERDtree, which will be detailed later.

Control p is initiated exactly how you'd expect, by inputting &lt;c-p&gt;. You can then switch between different
search modes by inputting 
