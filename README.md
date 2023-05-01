# Jackson: The Movie

This is a short social and romantic comedy, only 12-15 minutes long called "Jackson: The Movie". It's about a bad guy, an indecisive girl, and pistachio praline. Breaking the rules always leads to consequences.

## Installation

To install, just use the make target. This will take all the necessary steps

```bash
make install
```

## Formatting and linting

This codebase adheres to the Black opinionated PEP8 standard, read more [here](https://black.readthedocs.io/en/stable/).

To check if the code is properly formatted, run: 
```
make lint-check
```

To format the code with Black, run: 
```
make format
```

## Usage

SSAS has an array of utility scrips, together with the main service.

### Environment variables

All environment variables are defined in `.env` files. Where possible, default values will be
used for development, so creating/maintaining a `.env.dev` file is only necessary when you want to
override these default values. However, in some cases — mostly with secrets — there cannot be a
sensible default value. In these cases some processes can crash after updating the project. If you
need to know a variable, you can always ask a co-worker for this, until we have an automated way to
do this.
