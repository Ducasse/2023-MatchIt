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

{ #category : #'as yet unclassified' }
MtBoxElement >> bottmBox [ 

	^ self board grid
		  atColumn: self positionBoard x
		  atRow: self positionBoard y + 1
]

{ #category : #'as yet unclassified' }
MtBoxElement >> bottomBox [ 

	^ self board grid
		  atColumn: self positionBoard x
		  atRow: self positionBoard y + 1
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
MtBoxElement >> clickk [

	| list |
	list := OrderedCollection new.
	(self box hasSameColorAs: self onTopBox) ifTrue: [
		list add: self onTopBox surface.
		"self onTopBox surface clickk" ].
	(self box hasSameColorAs: self rightBox) ifTrue: [
		list add: self rightBox surface.
		"self rightBox surface clickk" ].
	(self box hasSameColorAs: self leftBox) ifTrue: [
		list add: self leftBox surface.
		"self leftBox surface clickk" ].
	(self box hasSameColorAs: self bottmBox) ifTrue: [
		list add: self bottmBox surface.
		"self bottmBox surface clickk" ].
	list ifNotEmpty: [ list add: self ].
	self parent removeChildren: list
]

{ #category : #initialization }
MtBoxElement >> initialize [

	super initialize.

	self geometry: BlCircleGeometry new.
	self clipChildren: false.
	self addEventHandlerOn: BlMouseUpEvent do: [ :anEvent | self clickk ]
]

{ #category : #'as yet unclassified' }
MtBoxElement >> leftBox [ 
	^ self board grid
		  atColumn: self positionBoard x - 1
		  atRow: self positionBoard y

]

{ #category : #'as yet unclassified' }
MtBoxElement >> onTopBox [ 
	^ self board grid
		  atColumn: self positionBoard x 
		  atRow: self positionBoard y-1
]

{ #category : #accessing }
MtBoxElement >> positionBoard [

	^ positionBoard
]

{ #category : #accessing }
MtBoxElement >> positionBoard: aposition [

	positionBoard := aposition
]

{ #category : #'as yet unclassified' }
MtBoxElement >> rightBox [ 
	^ self board grid
		  atColumn: self positionBoard  x + 1
		  atRow: self positionBoard y
]
