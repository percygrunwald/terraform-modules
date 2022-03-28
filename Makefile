.PHONY = clean

clean:
	@find . -name .terraform | tee /dev/stderr | xargs rm -rf
	@find . -name *.tfstate* | tee /dev/stderr | xargs rm -rf
	@find . -name .terraform.lock.hcl | tee /dev/stderr | xargs rm -rf
