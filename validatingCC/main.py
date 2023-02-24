
# https://www.hackerrank.com/challenges/validating-credit-card-number/problem
import re


sample = open('sample.txt', 'r')
creditCardNumbers = sample.readlines()[1:]
firstDigitInNumber = ('4', '5', '6')

for creditCardNumber in creditCardNumbers:
    if creditCardNumber.strip().startswith(firstDigitInNumber):
        if re.search(r'(\d)\1{3}', creditCardNumber.replace('-', '').strip()):
            print("invalid ")
        elif re.match(r'(\d{4}-){3}\d{4}', creditCardNumber.strip()):
            print("valid ")
        elif re.match(r'\d{16}', creditCardNumber.strip()):
            print("valid ")
        else:
            print("invalid ")
    else:
        print("invalid")
