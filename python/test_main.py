import pytest
from main import factorial


@pytest.mark.parametrize("n, expected", [
    (0, 1), (1, 1), (5, 120), (20, 2432902008176640000)
])
def test_factorial(n, expected):
    assert factorial(n) == expected


@pytest.mark.parametrize("n, error", [
    (-1, ValueError), (1.5, TypeError), (21, ValueError)
])
def test_invalid_input(n, error):
    with pytest.raises(error):
        factorial(n)
