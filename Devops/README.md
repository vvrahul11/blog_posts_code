"# Devops" 

Toy problem to start your journey into devops/mlops
------------
    ├── .gitignore
    ├── README.md          <- README
    ├── calculator.py   <- calculator code
    ├── requirements.txt    <- requirements
    ├── test_calculator.py  <- tests

# Run calculator
python calculator.py

# flake8 test
flake8 --exclude=venv* --statistics
# Run tests
pytest -v --cov

Reference:
1) https://realpython.com/python-continuous-integration/#next-steps
