Class {
	#name : #MtBox,
	#superclass : #MygAbstractBox,
	#instVars : [
		'color',
		'surface',
		'value',
		'colorDictionary'
	],
	#classVars : [
		'ValueDictionary'
	],
	#category : #'MatchIt-Model'
}

{ #category : #'as yet unclassified' }
MtBox class >> createBlue [
^ BlueBox new.

]

{ #category : #'as yet unclassified' }
MtBox class >> createGreen [

	^ GreenBox new
]

{ #category : #'as yet unclassified' }
MtBox class >> createMagenta [

	^ MagentaBox   new
]

{ #category : #'as yet unclassified' }
MtBox class >> createRed [

	^ RedBox  new 
]

{ #category : #'as yet unclassified' }
MtBox class >> randomLaunch [

	^ {
		  BlueBox.
		  GreenBox.
		  MagentaBox.
		  RedBox } atRandom new
]

{ #category : #'as yet unclassified' }
MtBox >> checkNeighbors [
	" this method continue checking all neighbors of the neighbors of the same color , it uses a similar stack system, it returns all the boxes with same color who are next to each other "

	| stack visited |
	stack := OrderedCollection new.
	visited := Set new. "use a Set to efficiently check for visited nodes."

	stack add: self.

	[ stack isEmpty ] whileFalse: [
		| current neighbors |
		current := stack removeLast.

		(visited includes: current) ifFalse: [
			visited add: current.
			neighbors := current sameColorNeighbors.
			neighbors isNotEmpty ifTrue: [
				neighbors do: [ :neighbor |
					(visited includes: neighbor) ifFalse: [ stack add: neighbor ] ] ] ] ].
	^ visited asOrderedCollection
]

{ #category : #public }
MtBox >> click [ 
self board removeBoxList: self checkNeighbors .
self board updateBoard.
]

{ #category : #accessing }
MtBox >> color [
	SubclassResponsibility 
]

{ #category : #accessing }
MtBox >> color: acolor [

	color := acolor
]

{ #category : #testing }
MtBox >> hasSameColorAs: aColoredBox [
	^self color = aColoredBox color
]

{ #category : #testing }
MtBox >> isBlueBox [ 
^false

]

{ #category : #testing }
MtBox >> isUncoloredBox [
^false
]

{ #category : #'as yet unclassified' }
MtBox >> sameColorNeighbors [
	" this method checks the top, bottom, right and left neighbor of the selected box and return those whose colors are the same "

	| neighbors |
	neighbors := OrderedCollection new.
	"we use the next set to check for top, right, left and bottom neighbors "
	#( #( 0 -1 ) #( 0 1 ) #( -1 0 ) #( 1 0 ) ) do: [ :offset |
		| newX newY neighbor |
		newX := self position x + offset first.
		newY := self position y + offset second.

		((newX between: 1 and: self board grid width) and:
			 (newY between: 1 and: self board grid height)) ifTrue: [
			neighbor := self board grid atColumn: newX atRow: newY.
			(neighbor isNotNil and: [ self hasSameColorAs: neighbor ]) ifTrue: [
				neighbors add: neighbor ] ] ].

	^ neighbors
]

{ #category : #accessing }
MtBox >> surface [
	^surface
]

{ #category : #accessing }
MtBox >> surface: aBoxElm [
	surface := aBoxElm
]

{ #category : #'as yet unclassified' }
MtBox >> topBox [
"return the box on top of the selected box "
	((self position x between: 1 and: self board grid width) and:
		 (self position y - 1 between: 1 and: self board grid height))
		ifTrue: [
			^ self board grid
				  atColumn: self position x
				  atRow: self position y - 1 ]
]
