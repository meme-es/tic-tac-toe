# Tic-Tac-Toe
> The game that is commonly known as noughts and crosses or X's and O's

Tic-tac-toe is a paper-and-pencil game for two players, X and O, who take turns marking the spaces in a 3×3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal arrangement is the winner.

![animated](./tic-tac-toe.gif)

This versión of the game was created using Ruby language in an interactive command-line game.

```
-------------
| 1 | 2 | 3 |
-------------
| 4 | 5 | 6 |
-------------
| 7 | 8 | 9 |
-------------
```

## Built With

- Ruby

### Prerequisites

- In order to run this game, you need to have Ruby installed.
- You can download or clone the project.

### Usage

Once you have Ruby installed and clone this project you can start a game running the next command.

```
ruby ./bin/main
```

If you are a Linux fan, you can create a soft link using the next command:

```
$ ln -s $PWD/bin/main /usr/local/bin/
```
$PWD: Present Working Directory

If you don't have the folder '/user/local/bin' you have to create it. 

Then just run:

```Ruby
main
```

## Game Play

Once you run the game, it will ask you for the name of the players and their symbols.

```
Please introduce the first player's name: Foo
Please choose one of the symbols X/O: X
Please introduce the second player's name: Bar
```

In the beginning, the game will show you the board filled with numbers of which you can choose in every turn.

```
-------------
| 1 | 2 | 3 |
-------------
| 4 | 5 | 6 |
-------------
| 7 | 8 | 9 |
-------------

Turn of Foo(x)
Choose a number between 1-9 that's hasn't been taken: 5
```

The game will switch turns.

```
-------------
| 1 | 2 | 3 |
-------------
| 4 | X | 6 |
-------------
| 7 | 8 | 9 |
-------------

Turn of Bar(O)
Choose a number between 1-9 that's hasn't been taken: 1
```

Until there is a winner or a tie

```
-------------
| X | X | O |
-------------
| 4 | X | 6 |
-------------
| O | O | X |
-------------

Game over: Foo with symbol X has won
Do you want keep playing y/n: y
```

```
-------------
| X | O | X |
-------------
| O | X | X |
-------------
| O | X | O |
-------------

Game over: Tie
Do you want keep playing y/n: n
```

## Authors

👤 **Jude K**

- Github: [@kbjude](https://github.com/kbjude)

👤 **Manuel**

- Github: [@meme-es](https://github.com/meme-es)
- Twitter: [@meme_es](https://twitter.com/meme_es)
- Linkedin: [linkedin](https://www.linkedin.com/in/manuel-elias-b289a638/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/meme-es/tic-tac-toe/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project has not licensed.
