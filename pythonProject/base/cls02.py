

class Animal:
    def __init__(self, nm):
        self.name = nm
    def move(self):
        print('move')
    def speak(self):
        pass

class Dog(Animal): #Animal상속받음
    def speak(self):
        print('break')
class Duck(Animal):
    def speak(self):
        print('quack')
dog = Dog("doggy")
print(dog.name) #부모 변수
dog.move()      #부모 메서드
dog.speak()     #
duck = Duck("donald")
print(duck.name)
duck.move()
duck.speak()

