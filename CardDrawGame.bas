' Card Draw Game - Oscar Costa
' Created in 2024 as part of Year 12 Software Design & Development

' Declare shared variables
Dim Shared selection As Integer
Dim Shared investment As Integer
Dim Shared tokens As Integer = 100
Dim Shared suits(3) As String
Dim Shared card_number(12) As String

' Initialise random number generator
Randomize Timer

' Initialise deck of cards
suits(0) = "Hearts"
suits(1) = "Diamonds"
suits(2) = "Clubs"
suits(3) = "Spades"

card_number(0) = "Ace"
card_number(1) = "2"
card_number(2) = "3"
card_number(3) = "4"
card_number(4) = "5"
card_number(5) = "6"
card_number(6) = "7"
card_number(7) = "8"
card_number(8) = "9"
card_number(9) = "10"
card_number(10) = "Jack"
card_number(11) = "Queen"
card_number(12) = "King"

' Display the menu options
Sub DisplayMenu()
    Color 3, 0
    Print !"\nSelect Which Option To Continue:"
    Print "1) Start Investment & Draw Deck of Cards"
    Print "2) View Total Investment"
    Print "3) Show all card options"
    Print "4) Reshow this menu"
    Print "5) Restart Program"
    Print "6) Exit program"
End Sub

' Draw five random cards
Sub DrawCards(suits() As String, card_number() As String, drawnCardNumbers() As Integer, drawnCardSuits() As Integer)
    Dim suitIndex As Integer
    Dim cardnumberIndex As Integer

    For i As Integer = 0 To 4
        suitIndex = Int(Rnd * 4)
        cardnumberIndex = Int(Rnd * 13)
        drawnCardNumbers(i) = cardnumberIndex
        drawnCardSuits(i) = suitIndex
        Print card_number(cardnumberIndex) & " of " & suits(suitIndex)
    Next
End Sub

' Display current number of tokens
Sub CurrentTokens(tokens As Integer)
    Color 6, 0
    Print !"\nTotal Tokens: "; tokens
End Sub

' Print all card options in the deck
Sub PrintCardOptions(suits() As String, card_number() As String)
    Dim i As Integer
    Dim j As Integer

    Color 6, 0
    Print !"\nDeck Of Cards:"

    For i = 0 To UBound(card_number)
        For j = 0 To UBound(suits)
            Print card_number(i) & " of " & suits(j)
        Next
    Next
End Sub

' Evaluate the drawn hand and calculate winnings
Function EvaluateHand(drawnCardNumbers() As Integer, drawnCardSuits() As Integer, investment As Integer) As Integer
    Dim cardValues(12) As Integer
    Dim suitValues(3) As Integer
    Dim winnings As Integer

    For i As Integer = 0 To 4
        cardValues(drawnCardNumbers(i)) += 1
        suitValues(drawnCardSuits(i)) += 1
    Next

    For i As Integer = 0 To 12
        If cardValues(i) = 2 Then winnings += 2 * investment
        If cardValues(i) = 3 Then winnings += 3 * investment
        If cardValues(i) = 4 Then winnings += 4 * investment
        If cardValues(i) = 5 Then winnings += 5 * investment
    Next

    For i As Integer = 0 To 3
        If suitValues(i) = 5 Then winnings += 5 * investment
    Next

    Dim allSameSuit As String = "True"
    Dim orderedCards As String = "True"
    Dim minIndex As Integer = 0
    Dim nextCard As Integer = drawnCardNumbers(0)

    For i As Integer = 1 To 4
        If drawnCardSuits(i) <> drawnCardSuits(0) Then
            allSameSuit = "False"
            Exit For
        End If
    Next

    For i As Integer = 1 To 4
        If drawnCardNumbers(i) < nextCard Then
            nextCard = drawnCardNumbers(i)
            minIndex = i
        End If
    Next

    For i As Integer = 1 To 4
        If drawnCardNumbers((minIndex + i) Mod 5) <> (nextCard + i) Mod 13 Then
            orderedCards = "False"
            Exit For
        End If
    Next

    If allSameSuit = "True" And orderedCards = "True" Then
        winnings += 10 * investment
    End If

    EvaluateHand = winnings
End Function

' Main game loop
Sub GameLoop()
    Color 9, 0
    Print !"Oscar Costa - Year 12 Software Design & Development - Task 3"

    DisplayMenu()

    Do
        Color 3, 0
        Print ""
        Input "Enter your menu choice: ", selection

        If selection = 1 Then
            Dim investmentPlaced As String = "False"
            Do
                Color 6, 0
                Print ""
                Input "Enter your investment: ", investment

                If investment > tokens Then
                    Color 4, 0
                    Print "You don't have enough tokens to investment that amount."
                Else
                    investmentPlaced = "True"
                    tokens -= investment
                    Print !"\nTokens remaining: "; tokens ;!"\n"

                    Dim drawnCardNumbers(4) As Integer
                    Dim drawnCardSuits(4) As Integer
                    DrawCards(suits(), card_number(), drawnCardNumbers(), drawnCardSuits())

                    Dim winnings As Integer = EvaluateHand(drawnCardNumbers(), drawnCardSuits(), investment)
                    tokens += winnings

                    If winnings > 0 Then
                        Color 2, 0
                        Print !"You won ";winnings;" tokens!"
                    Else
                        Color 4, 0
                        Print !"You didn't win this time."
                    End If

                    Print !"Tokens remaining: "; tokens
                End If
            Loop Until investmentPlaced = "True"
        ElseIf selection = 2 Then
            CurrentTokens(tokens)
        ElseIf selection = 3 Then
            PrintCardOptions(suits(), card_number())
        ElseIf selection = 4 Then
            DisplayMenu()
        ElseIf selection = 5 Then
            CLS()
            tokens = 100
            Color 9, 0
            Print !"Oscar Costa - Year 12 Software Design & Development - Task 3"
            DisplayMenu()
        Else
            Color 4, 0
            Print !"\nInvalid selection."
        End If
    Loop Until selection = 6
End Sub

GameLoop()
