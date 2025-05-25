'''  before running this make sure you have installed python  lsp in  your system 

npm install -g pyright
which pyright

check the documentation on our website 

'''

print("hi")

class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        return "..."

    def info(self):
        def inner_info():
            return f"Name is {self.name}"
        return inner_info()


class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)
        self.breed = breed

    def speak(self):
        return "Woof!"

    def fetch(self):
        def with_ball():
            return "Fetching the ball"
        def with_stick():
            return "Fetching the stick"
        return with_ball()


class Cat(Animal):
    def speak(self):
        return "Meow"

    def scratch(self):
        class ScratchLevel:
            def __init__(self, level):
                self.level = level

            def describe(self):
                return f"Scratch level is {self.level}"
        
        lvl = ScratchLevel(3)
        return lvl.describe()


def standalone_function():
    print("I am not part of any class /n  Testing breadcrumbs")


standalone_function()

