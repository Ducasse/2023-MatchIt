Class {
	#name : #MtBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'MatchIt-UI'
}

{ #category : #'specific opening' }
MtBoardElement class >> advancedLevel [

	^ self launchWith: MtBoard level02
]

{ #category : #'specific opening' }
MtBoardElement class >> basicLevel [

	^ self launchWith: MtBoard level01
]

{ #category : #opening }
MtBoardElement class >> launchWith: model [

	| anElm space |
	space := BlSpace new.
	anElm := self new
		         board: model;
		         yourself.

	space root addChild: anElm.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: anElm extent.
	space resizable: true.
	space show.
	^ space
]

{ #category : #accessing }
MtBoardElement >> board [

	^ board
]

{ #category : #accessing }
MtBoardElement >> board: aBoard [

	board := aBoard.
	self padding: (BlInsets all: 5).
	self layout columnCount: board width.
	board grid do: [ :aBox |
		| boxElm |
		boxElm := (MtBoxElement createWithBox: aBox)
			          board: aBoard;
			          background: aBox color;
			          positionBoard: aBox position.
		aBox surface: boxElm.
		self addChild: boxElm ]
]

{ #category : #initialization }
MtBoardElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color lightMagenta).
	self layout: BlGridLayout new.
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]

{ #category : #initialization }
MtBoardElement >> requestLayout [

	
]
