# pydist-just

This is a python packaging wrapper around `just` (https://github.com/casey/just) that makes it installable via `pip`.  This is handy, since it can then be added as a dependency to other packages to make for a quick way to install multiple CLIs when a python toolchain is available.

This follows a basic structure:

1. Each binary in the `just` releases page is mapped to a pypi platform tag.
2. For each of these, the `build_wheels.py` script loops through and constructs a wheel.
3. These wheels are uploaded to pypi.
