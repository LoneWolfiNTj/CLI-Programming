#! /usr/local/bin/apl --script
size←5
{↑(⍵1⍴{(({⍵⍴' '}⌈((size-⍵)÷2)),{⍵⍴'*'}⍵),{⍵⍴' '}⌈((size-⍵)÷2)}¨({(2×⍳⌈(⍵÷2))-1}⍵),⌽{(2×⍳⌈((⍵-2)÷2))-1}⍵)}size