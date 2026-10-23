# Factorial CI variant 4

Bash and Python implementations of factorial for integers 0 through 20.
The common upper bound prevents overflow in Bash signed 64-bit arithmetic.
Each implementation has seven test cases, including invalid inputs.

```sh
shellcheck -x bash/*.sh
bash bash/test.sh
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements-dev.txt
flake8 python
cd python
pytest --cov=main --cov-branch --cov-fail-under=100
```

GitHub Actions checks lint, tests and coverage, archives source and reports,
and builds two Docker targets. No image is published.
Triggers: code pushes, pull requests, manual runs and daily at 02:00 UTC.
