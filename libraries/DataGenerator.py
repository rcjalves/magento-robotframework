from faker import Faker
import random

class DataGenerator:
    def __init__(self):
        self.fake = Faker()
        self.generated_data = {}

    def generate_email(self):
        email = f"{self.fake.user_name()}{random.randint(100,999)}@test.com"
        self.generated_data['email'] = email
        return email

    def generate_password(self):
        password = self.fake.password(length=12, special_chars=True, digits=True, upper_case=True, lower_case=True)
        self.generated_data['password'] = password
        return password

    def generate_address_data(self):
        address = {
            'firstname': self.fake.first_name(),
            'lastname': self.fake.last_name(),
            'company': self.fake.company(),
            'street': self.fake.street_address(),
            'city': self.fake.city(),
            'state': self.fake.state(),
            'zipcode': self.fake.zipcode(),
            'country': 'United States',
            'phone': self.fake.phone_number()
        }
        self.generated_data['address'] = address
        return address

    def get_generated_data(self):
        return self.generated_data