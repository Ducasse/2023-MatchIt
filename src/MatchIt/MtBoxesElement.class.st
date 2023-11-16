Class {
	#name : #MtBoxesElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'box',
		'positionBoard'
	],
	#category : #MatchIt
}

{ #category : #'as yet unclassified' }
MtBoxesElement class >> createWithBox: anMtBoxes [

	^ self new box: anMtBoxes
]

{ #category : #accessing }
MtBoxesElement >> back [

	^ self background
]

{ #category : #accessing }
MtBoxesElement >> back: aColor [

	self background: aColor
]

{ #category : #accessing }
MtBoxesElement >> board [

	^ board
]

{ #category : #accessing }
MtBoxesElement >> board: aBoard [

	board := aBoard.
	self size: 60 @ 60
]

{ #category : #'as yet unclassified' }
MtBoxesElement >> bottmBox [ 

	^ self board grid
		  atColumn: self positionBoard x
		  atRow: self positionBoard y + 1
]

{ #category : #'as yet unclassified' }
MtBoxesElement >> bottomBox [ 

	^ self board grid
		  atColumn: self positionBoard x
		  atRow: self positionBoard y + 1
]

{ #category : #accessing }
MtBoxesElement >> box [

	^ box
]

{ #category : #accessing }
MtBoxesElement >> box: anMtBoxes [

	box := anMtBoxes
]

{ #category : #initialization }
MtBoxesElement >> initialize [

	super initialize.

	self geometry: BlCircleGeometry new.
	self clipChildren: false.
	"self addEventHandlerOn: BlMouseUpEvent do: [ :anEvent | self clickk ]"
]

{ #category : #'as yet unclassified' }
MtBoxesElement >> leftBox [ 
	^ self board grid
		  atColumn: self positionBoard x - 1
		  atRow: self positionBoard y

]

{ #category : #'as yet unclassified' }
MtBoxesElement >> onTopBox [ 
	^ self board grid
		  atColumn: self positionBoard x 
		  atRow: self positionBoard y-1
]

{ #category : #accessing }
MtBoxesElement >> positionBoard [

	^ positionBoard
]

{ #category : #accessing }
MtBoxesElement >> positionBoard: aposition [

	positionBoard := aposition
]

{ #category : #'as yet unclassified' }
MtBoxesElement >> rightBox [ 
	^ self board grid
		  atColumn: self positionBoard  x + 1
		  atRow: self positionBoard y
]
