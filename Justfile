NAME:='just'
VERSION:='1.16.0'
PYPI_VERSION:='1.16.1'
URL:='https://github.com/casey/just/releases'


@default:
    just --list

@init:
    [ -f Pipfile.lock ] && echo "Lockfile already exists" || PIPENV_VENV_IN_PROJECT=1 pipenv lock
    PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev

@build: init
    pipenv run python build_wheels.py --name {{NAME}} --version {{VERSION}} --pypi_version {{PYPI_VERSION}} --url {{URL}}

@register:
    git diff --name-only HEAD^1 HEAD -G"^PYPI_VERSION:=" "Justfile" | uniq | xargs -I {} sh -c 'just _register'

@_register: init build
    pipenv run twine upload -u $PYPI_USERNAME -p $PYPI_PASSWORD dist/*
