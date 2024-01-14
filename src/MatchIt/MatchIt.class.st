Class {
	#name : #MatchIt,
	#superclass : #Object,
	#category : #'MatchIt-Model'
}

{ #category : #menu }
MatchIt class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color orange;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : #menu }
MatchIt class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: ' ** A little information **
The Same Game (SameGame) is a challenging puzzle game originally invented by
Kuniaki Moribe (Morisuke) in 1985. The original name of the game was «Chain
Shot!» 		 
     Objective : 
 - The goal of the game is to clear the board completely, and with the highest score
possible.
     Gameplay :
 - The board is filled at random by four different colors. Clicking on two or
more adjoining boxes of the same color will make them disappear. Boxes no
longer supported by removed boxes will fall down, and empty columns will be
trimmed away by the remaining boxes sliding to the left.
     Scoring :
 - By removing a number (n) of bubbles you will be rewarded by (n-2) points.
Therefore, the more bubbles you remove at once, the higher your score will be.
The game ends when you have cleared all safe cells.
			
 * You can choose different levels when starting'.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightMagenta;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := BlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal fitContent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #menu }
MatchIt class >> menuLevel [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Start').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Basic') whenClickedDo: [
			 MtBoardElement basicLevel ]).

	menu addItem:
		((ToButtonMenuItem new labelText: 'Advanced') whenClickedDo: [
			 MtBoardElement advancedLevel ]).
	^ menu
]

{ #category : #'instance creation' }
MatchIt class >> open [

	| space startMenu helpMenu bar message |
	startMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	message := self openMsg.

	bar addMenu: startMenu.
	bar addMenu: helpMenu.
	space := BlSpace new.

	space root addChild: message.
	space root addChild: bar.
	space extent: 600 @ 600.
	space show
]

{ #category : #'instance creation' }
MatchIt class >> openMsg [

	| msg |
	msg := BlElement new background: Color lightOrange.
	msg constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	msg layout: BlFrameLayout new.
	msg addChild: ((BlTextElement new text:
			  ((' Welcome to MatchIt SameGame, Have Fun!' asRopedText
				    fontName: 'Phosphate') fontSize: 30)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ msg
]
