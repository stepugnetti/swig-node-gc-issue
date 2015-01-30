install: build/Release/dummy-module.node
	cp package.json build/Release
	if [ ! -d node_modules ]; then  mkdir node_modules; fi
	npm install build/Release
	npm install safe

build/Release/dummy-module.node: dummy-module_wrap.cxx binding.gyp
	node-gyp configure build

dummy-module_wrap.cxx: dummy-module.i
	swig -c++ -javascript -node dummy-module.i

clean:
	rm dummy-module_wrap.cxx
	rm -r -f build
	rm -r -f node_modules

	
