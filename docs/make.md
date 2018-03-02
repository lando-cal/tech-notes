GNU make

# Automatic variables

```
$ cat Makefile
all: foo_one foo_two

foo_%: bar_a bar_b
    echo $*: this is $@ and it requires $^

bar_%: baz
    echo $*: this is $@ and it requires $^

baz:
    echo this is baz

$ make
echo this is baz
this is baz
echo a: this is bar_a and it requires baz
a: this is bar_a and it requires baz
echo b: this is bar_b and it requires baz
b: this is bar_b and it requires baz
echo one: this is foo_one and it requires bar_a bar_b
one: this is foo_one and it requires bar_a bar_b
echo two: this is foo_two and it requires bar_a bar_b
two: this is foo_two and it requires bar_a bar_b
```

# Links

- <https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html>
- <https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html>
