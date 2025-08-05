# 🃏 Year 12 Software Design & Development – 2024  
## 🎮 Console Card Draw Game (FreeBASIC)

A console-based card draw game developed in **FreeBASIC** as part of a Year 12 Software Design and Development course in 2024.

---

## 📌 Project Overview

This project was created to demonstrate key programming concepts, including:

- 🎲 Random number generation  
- 🔁 Control structures (loops, conditionals)  
- 🔣 Functions and subroutines  
- ⌨️ Console input/output and formatting  
- 🗂️ Basic array use and simulation of card drawing mechanics  

---

## 💡 Game Description

Players invest tokens and draw **five random cards**.

Winnings are calculated based on:
- Matching card values
- Matching suits
- Bonus combinations like **flushes**, **pairs**, or **sequences**

---

## 🖼️ Screenshots

<img src="https://r2.fivemanage.com/image/BjKhtIYz8CfL.png" width="400"/>  
<img src="https://r2.fivemanage.com/image/8q65qu4WMBOE.png" width="400"/>  
<img src="https://r2.fivemanage.com/image/mnhI8plWczXw.png" width="400"/>  
<img src="https://r2.fivemanage.com/image/XGg2F6g8IiXw.png" width="400"/>  

---

## 🧑‍💻 Code Sample

```basic
FOR i = 1 TO 5
    cardIndex = INT(RND * 52) + 1
    selectedCards(i) = deck(cardIndex)
    PRINT "Card "; i; ": "; selectedCards(i)
NEXT i

