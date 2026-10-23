"""Factorial for the shared Bash and Python input domain 0..20."""


def factorial(n):
    if type(n) is not int:
        raise TypeError("Expected an integer")
    if not 0 <= n <= 20:
        raise ValueError("Expected a number from 0 to 20")
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
