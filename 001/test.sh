#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  echo "expected => $expected"
  echo "input => $input"


  ./9cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

#assert 0 0
assert 112 112

echo OK
