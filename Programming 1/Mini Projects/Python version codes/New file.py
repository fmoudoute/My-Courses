from kivy.app import App
from kivy.graphics import *
from kivy.uix.widget import Widget

class Game(Widget):

    def __init__(self):
        super(Game, self).__init__()
        with self.canvas:
    # Add a red color
            Color(1., 0, 0)

    # Add a rectangle
            Rectangle(pos=(10, 10), size=(500, 500))

class GameApp(App):
    def build(self):
        game = Game() #For Testin
        #Window.size = game.size #For Testing
        return game #For Testing
        #top = Widget()
        #top.add_widget(Menu())
        #Window.size = top.children[0].size
        #return top

if __name__ == "__main__":
    GameApp().run()