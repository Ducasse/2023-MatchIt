Class {
	#name : #MtBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'box',
		'positionBoard'
	],
	#category : #'MatchIt-UI'
}

{ #category : #'as yet unclassified' }
MtBoxElement class >> createWithBox: anMtBoxes [

	^ self new box: anMtBoxes
]

{ #category : #accessing }
MtBoxElement >> back [

	^ self background
]

{ #category : #accessing }
MtBoxElement >> back: aColor [

	self background: aColor
]

{ #category : #accessing }
MtBoxElement >> board [

	^ board
]

{ #category : #accessing }
MtBoxElement >> board: aBoard [

	board := aBoard.
	self size: 60 @ 60
]

{ #category : #accessing }
MtBoxElement >> box [

	^ box
]

{ #category : #accessing }
MtBoxElement >> box: anMtBoxes [

	box := anMtBoxes
]

{ #category : #'as yet unclassified' }
MtBoxElement >> click [
  "this method will be removed later , tthis is just for checking visually "
	| neighbors |
	neighbors := self box checkNeighbors.
	neighbors size >= 3 ifTrue: [
		neighbors do: [ :each |
			each surface parent removeChild: each surface ] ]
]

{ #category : #initialization }
MtBoxElement >> initialize [

	super initialize.

	self geometry: BlCircleGeometry new.
	self clipChildren: false.
	self addEventHandlerOn: BlMouseUpEvent do: [ :anEvent | self click ]
]

{ #category : #accessing }
MtBoxElement >> positionBoard [

	^ positionBoard
]

{ #category : #accessing }
MtBoxElement >> positionBoard: aposition [

	positionBoard := aposition
]
