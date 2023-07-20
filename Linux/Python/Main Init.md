Boiler plate starting file

``` Python
#!/usr/bin/env python3

class Main:
    def __init__(self, print):
        pass
    def print(self):
        print("Hello World!")

if ( __name__ == "__main__"):
    try:
        main = Main(print)
    except KeyboardInterrupt:
        print("Exiting due to keyboard inturrupt...")
        exit(0)
```
