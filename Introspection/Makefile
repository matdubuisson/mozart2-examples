files := VMIntrospection.oz ThreadIntrospection.oz NodeIntrospection.oz VariableIntrospection.oz
objects := $(files:.oz=.ozf)

build: $(objects)
%.ozf: %.oz
	ozc -c $< -o $@

.PHONY: clean
clean:
	rm $(objects)
