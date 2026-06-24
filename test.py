import sys

print("Hello from Python!")
try:
    name = input("Enter your name: ")
    print(f"Nice to meet you, {name}!")
except EOFError:
    print("No name entered (EOF reached).")
