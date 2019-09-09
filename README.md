# Orchard

My family plays the game [Orchard](https://www.habausa.com/orchard-game/). It is a [cooperative game](https://corwin-connect.com/2016/01/cooperative-games-101-what-are-cooperative-games-and-how-can-they-help-education/) where the players roll a die and, together, try to defeat a bird.

We often win (beat the bird), so I got to wondering what the probabilities were. This code simulates the game. When done over and over again, it turns out the probability of winning (when played optimally) is around __68%__. Maybe that's a smart call because the kids do not like it when we lose.

![Orchard game box](https://github.com/bleonard/orchard/raw/master/gamebox.png)

## Strategies

When the die is rolled, what comes up is one of the 4 fruits, a basket, or a bird. The board starts with 10 of each of the 4 fruits and no bird cards. When a fruit is rolled, a piece of fruit of that type is removed. Whena basket is rolled, you can select any 2 fruit pieces and remove them. When a bird is rolled, one of 9 bird cards is added. If all of the fruit is removed before the 98th bird card is added, the players win the game.

In this world, the only real strategy is what fruit to select when the basket is rolled.

### Most (68% wins)
This strategy produces the best results. When the basket is rolled, select the type of fruit that has the most remaining on the board. This can be two of the same or two different fruits.

### Random (63% wins)
When the basket is rolled, select two fruits at random from the board.

### Least (53% wins)
This strategy produces the worst results. When the basket is rolled, select the type of fruit that has the least remaining on the board. This purposely sabotages your efforts, but still results in a slight probabilty of winning.

## Variations

This code can also see what happens when the rules are slightly different.

### Count

I also experimented with seeing what would happen if the basket only allowed 1 fruit to be removed instead of 2. In the optimal strategy, this produces a 47% chance of winning. I belive it's less than 50% because the bird only has to get to 9, whereas the fruit has 10 each.

### Others

Maybe later, I think it would be interesting to looking into more or less fruits or number of bird cards.
It might also be interesting to see statistics on what's left at the end of the game.

## Commands

```bash
[~/orchard]$ bundle exec rake -T
rake orchard:all       # Simulate game with each strategy to see probabilities
rake orchard:simulate  # Play game many times with best strategy to see probabilities
rake orchard:single    # Play game one time with turn output and see who wins
```

```bash
[~/orchard]$ rake orchard:simulate
Wins (Strategy: most, Basket Count: 2)
Players: 68627
Bird   : 31373
Percent: 68.6%

[~/orchard]$ rake orchard:single
Rolled: apple | apple: 9 | blueberry: 10 | cherry: 10 | pear: 10 | bird: 9
Rolled: basket | apple: 9 | blueberry: 10 | cherry: 9 | pear: 9 | bird: 9
Rolled: cherry | apple: 9 | blueberry: 10 | cherry: 8 | pear: 9 | bird: 9
Rolled: pear | apple: 9 | blueberry: 10 | cherry: 8 | pear: 8 | bird: 9
Rolled: pear | apple: 9 | blueberry: 10 | cherry: 8 | pear: 7 | bird: 9
Rolled: basket | apple: 9 | blueberry: 8 | cherry: 8 | pear: 7 | bird: 9
Rolled: bird | apple: 9 | blueberry: 8 | cherry: 8 | pear: 7 | bird: 8
Rolled: cherry | apple: 9 | blueberry: 8 | cherry: 7 | pear: 7 | bird: 8
Rolled: basket | apple: 7 | blueberry: 8 | cherry: 7 | pear: 7 | bird: 8
Rolled: bird | apple: 7 | blueberry: 8 | cherry: 7 | pear: 7 | bird: 7
Rolled: blueberry | apple: 7 | blueberry: 7 | cherry: 7 | pear: 7 | bird: 7
Rolled: basket | apple: 7 | blueberry: 6 | cherry: 7 | pear: 6 | bird: 7
Rolled: basket | apple: 6 | blueberry: 6 | cherry: 6 | pear: 6 | bird: 7
Rolled: cherry | apple: 6 | blueberry: 6 | cherry: 5 | pear: 6 | bird: 7
Rolled: bird | apple: 6 | blueberry: 6 | cherry: 5 | pear: 6 | bird: 6
Rolled: basket | apple: 6 | blueberry: 5 | cherry: 5 | pear: 5 | bird: 6
Rolled: blueberry | apple: 6 | blueberry: 4 | cherry: 5 | pear: 5 | bird: 6
Rolled: blueberry | apple: 6 | blueberry: 3 | cherry: 5 | pear: 5 | bird: 6
Rolled: basket | apple: 5 | blueberry: 3 | cherry: 5 | pear: 4 | bird: 6
Rolled: blueberry | apple: 5 | blueberry: 2 | cherry: 5 | pear: 4 | bird: 6
Rolled: pear | apple: 5 | blueberry: 2 | cherry: 5 | pear: 3 | bird: 6
Rolled: blueberry | apple: 5 | blueberry: 1 | cherry: 5 | pear: 3 | bird: 6
Rolled: bird | apple: 5 | blueberry: 1 | cherry: 5 | pear: 3 | bird: 5
Rolled: cherry | apple: 5 | blueberry: 1 | cherry: 4 | pear: 3 | bird: 5
Rolled: blueberry | apple: 5 | blueberry: 0 | cherry: 4 | pear: 3 | bird: 5
Rolled: basket | apple: 4 | blueberry: 0 | cherry: 3 | pear: 3 | bird: 5
Rolled: basket | apple: 2 | blueberry: 0 | cherry: 3 | pear: 3 | bird: 5
Rolled: basket | apple: 2 | blueberry: 0 | cherry: 2 | pear: 2 | bird: 5
Rolled: pear | apple: 2 | blueberry: 0 | cherry: 2 | pear: 1 | bird: 5
Rolled: blueberry | apple: 2 | blueberry: 0 | cherry: 2 | pear: 1 | bird: 5
Rolled: pear | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 5
Rolled: blueberry | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 5
Rolled: blueberry | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 5
Rolled: blueberry | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 5
Rolled: blueberry | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 5
Rolled: bird | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 4
Rolled: bird | apple: 2 | blueberry: 0 | cherry: 2 | pear: 0 | bird: 3
Rolled: basket | apple: 1 | blueberry: 0 | cherry: 1 | pear: 0 | bird: 3
Rolled: blueberry | apple: 1 | blueberry: 0 | cherry: 1 | pear: 0 | bird: 3
Rolled: bird | apple: 1 | blueberry: 0 | cherry: 1 | pear: 0 | bird: 2
Rolled: apple | apple: 0 | blueberry: 0 | cherry: 1 | pear: 0 | bird: 2
Rolled: blueberry | apple: 0 | blueberry: 0 | cherry: 1 | pear: 0 | bird: 2
Rolled: pear | apple: 0 | blueberry: 0 | cherry: 1 | pear: 0 | bird: 2
Rolled: cherry | apple: 0 | blueberry: 0 | cherry: 0 | pear: 0 | bird: 2 | WINNER: players
Winner: players

[~/orchard]$ rake orchard:all
Wins (Strategy: most, Basket Count: 2)
Players: 68189
Bird   : 31811
Percent: 68.2%

Wins (Strategy: most, Basket Count: 1)
Players: 47419
Bird   : 52581
Percent: 47.4%

Wins (Strategy: random, Basket Count: 2)
Players: 63670
Bird   : 36330
Percent: 63.7%

Wins (Strategy: random, Basket Count: 1)
Players: 40570
Bird   : 59430
Percent: 40.6%

Wins (Strategy: least, Basket Count: 2)
Players: 53305
Bird   : 46695
Percent: 53.3%

Wins (Strategy: least, Basket Count: 1)
Players: 32371
Bird   : 67629
Percent: 32.4%
```