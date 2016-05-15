# irssi-mindfulness

Be more careful of the language you use.

This irssi script will stop you from sending messages that contain a word or
phrase that you want to stop saying.

## Background

I say the phrase "you guys" a lot, and it's not appropriate. Someone at Vox
wrote an article about [cutting "you guys" from their
vocabulary](http://www.vox.com/2015/6/11/8761227/you-guys-sexism-language) in
response to [npm's "Guys jar" blog
post](http://blog.npmjs.org/post/120475872425/this-is-npms-guys-jar-we-didnt-invent-the).

Changing habits is hard, but I hope that this will help me.

## Installation

Drop mindfulness.pl into ~/.irssi/scripts, optionally create a symlink to it in
~/.irssi/scripts/autorun, and `/script load mindfulness`.

## Settings

- The term that you want to stop saying can by changed by the setting
  `Mindfulness_term`. It defaults to "you guys".
- Error highlighting can be changed to any irssi formatting code by updating
  the setting `Mindfulness_error_effect`. It defaults to underlining (`%U`).
