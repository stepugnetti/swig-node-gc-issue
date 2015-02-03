ifdef DEBUG
  distro := Debug
  gyp-opts := --debug
else
  distro := Release
endif

install: build/$(distro)/dummy-module.node
	cp package.json build/$(distro)
	if [ ! -d node_modules ]; then  mkdir node_modules; fi
	npm install build/$(distro)
	npm install safe

build/$(distro)/dummy-module.node: dummy-module_wrap.cxx binding.gyp
	node-gyp configure build $(gyp-opts)

dummy-module_wrap.cxx: dummy-module.i
	swig -c++ -javascript -node dummy-module.i

clean:
	if [ -f dummy-module_wrap.cxx ]; then rm dummy-module_wrap.cxx; fi
	if [ -d build ]; then rm -r -f build; fi
	if [ -d node_modules ]; then rm -r -f node_modules; fi


