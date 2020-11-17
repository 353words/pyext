all:
	$(error please pick a target)


_checksig.so: *.go
	go build -buildmode=c-shared -o $@

so: _checksig.so

clean:
	-rm -f *.h *.so
	-rm -rf checksig.egg-info build dist

test: test-a test-b

test-a:
	docker build -f Dockerfile.test-a .

test-b:
	docker build -f Dockerfile.test-b .
