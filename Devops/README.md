"# Devops" 

My journey into devops

Devops/
├── .gitignore
├── README.md
└── calculator.py
├── requirements.txt
└── test_calculator.py


# Run calculator
python calculator.py

# flake8 test
flake8 --exclude=venv* --statistics
# Run tests
pytest -v --cov

Reference:
1) https://realpython.com/python-continuous-integration/#next-steps
