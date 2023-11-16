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

{ #category : #accessing }
MtBoxesElement >> positionBoard [

	^ positionBoard
]

{ #category : #accessing }
MtBoxesElement >> positionBoard: aposition [

	positionBoard := aposition
]
