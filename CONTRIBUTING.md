# Contributing to Belvaio Request Id

Contributions are welcome, and they are greatly appreciated! Every little bit
helps, and credit will always be given.

To submit new code to the project you'll need to:

* Fork the repo.
* Clone your fork on your local computer: `git clone https://github.com/<username>/belvaio-request-id.git`.
* Install Belvaio Request Id locally and run the tests: `make install`, `make test`.
* Create a branch for your work, e.g. `git checkout -b fix-some-bug`.
* Remember to include tests if applicable.
* Once ready, push to your remote: `git push origin fix-some-bug`.
* [Open a Pull Request][pull-request].

## Install

**Note**: These scripts are currently suited to **Linux** and **macOS**, but we would happily take pull requests to help us make them more cross-compatible.

Use the `install` script to install project dependencies in a virtual environment.

```bash
make install
```

## Running the tests

The tests are written using [pytest] and located in the `tests/` directory.

**Note**: tests should be run before making any changes to the code in order to make sure that everything is running as expected.

We provide a stand-alone **test script** to run tests in a reliable manner. Run it with:

```bash
make test
```

## Linting

We use [Black][black] as a code formatter. To run it along with a few other linting tools, we provide a stand-alone linting script:

```bash
make lint
```

If linting has anything to say about the code, you can use `fix=yes` command option to format it in-place.

To keep the code style consistent, you should apply linting before committing.

[issues]: https://github.com/belvo-finance/belvaio-request-id/issues/new
[pull-request]: https://github.com/belvo-finance/belvaio-request-id/compare
[pytest]: https://docs.pytest.org
[pytest-cov]: https://github.com/pytest-dev/pytest-cov
[black]: https://github.com/psf/black
