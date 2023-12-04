Class {
	#name : #MtBox,
	#superclass : #MygAbstractBox,
	#instVars : [
		'color',
		'surface'
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
	^{
			BlueBox .
			GreenBox .
			MagentaBox .
			RedBox } atRandom new 
]

{ #category : #'as yet unclassified' }
MtBox >> checkNeighbors [
	" this method continue checking all neighbors of the neighbors of the same color , it uses a similar stack system "

	| stack visited |
	stack := OrderedCollection new.
	visited := OrderedCollection new.

	stack add: self.

	[ stack isEmpty ] whileFalse: [
		| current neighbors |
		current := stack removeLast.

		neighbors := current sameColorNeighbors.
		neighbors isNotEmpty ifTrue: [ stack addAll: neighbors ].
		visited add: current ].
	^ visited
]

{ #category : #accessing }
MtBox >> color [
	SubclassResponsibility 
]

{ #category : #testing }
MtBox >> hasSameColorAs: aColoredBox [
	^self color = aColoredBox color
]

{ #category : #'as yet unclassified' }
MtBox >> sameColorNeighbors [
	" this method checks all neighbors and return those whose colors are the same "

	| neighbors |
	neighbors := OrderedCollection new.

	#( #( 0 -1 ) #( -1 0 ) #( 1 0 ) ) do: [ :offset |
		| newX newY neighbor |
		newX := position x + offset first.
		newY := position y + offset second.

		((newX between: 1 and: 4) and: (newY between: 1 and: 4)) ifTrue: [
			neighbor := self board grid atColumn: newX atRow: newY.
			(neighbor isNotNil and: [ neighbor hasSameColorAs: self ]) ifTrue: [
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
