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
	if [ -f dummy-module_wrap.cxx ]; then rm dummy-module_wrap.cxx; fi
	if [ -d build ]; then rm -r -f build; fi
	if [ -d node_modules ]; then rm -r -f node_modules; fi

	
