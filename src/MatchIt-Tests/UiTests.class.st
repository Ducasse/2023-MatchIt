Class {
	#name : #UiTests,
	#superclass : #TestCase,
	#instVars : [
		'field',
		'matrix'
	],
	#category : #'MatchIt-Tests'
}

{ #category : #running }
UiTests >> setUp [

	super setUp.
	matrix := CTNewArray2D width: 4 height: 4.
	matrix at: 1 @ 1 put: MtBox createGreen.
	matrix at: 1 @ 2 put: MtBox createGreen.
	matrix at: 1 @ 3 put: MtBox createGreen.
	matrix at: 1 @ 4 put: MtBox createGreen.
	matrix at: 2 @ 1 put: MtBox createRed.
	matrix at: 2 @ 2 put: MtBox createRed.
	matrix at: 2 @ 3 put: MtBox createRed.
	matrix at: 2 @ 4 put: MtBox createRed.
	matrix at: 3 @ 1 put: MtBox createMagenta.
	matrix at: 3 @ 2 put: MtBox createMagenta.
	matrix at: 3 @ 3 put: MtBox createMagenta.
	matrix at: 3 @ 4 put: MtBox createMagenta.
	matrix at: 4 @ 1 put: MtBox createBlue.
	matrix at: 4 @ 2 put: MtBox createBlue.
	matrix at: 4 @ 3 put: MtBox createBlue.
	matrix at: 4 @ 4 put: MtBox createBlue.

	field := MtBoard createBoardMatrix: matrix
]

{ #category : #tests }
UiTests >> test2x2MatDifferentColors [

	| board |
	board := MtBoardElement launchWith: MtBoard mat2x2.
	self assert: board children first children size equals: 4
	
	
]

{ #category : #tests }
UiTests >> testBoxSameColorNeighbors [
|box list box1 box2|
box := field grid at:2@3.
box1 := field grid at:2@2.
box2 := field grid at:3@2.

list := box sameColorNeighbors .
self assert: (list includes: box1) .
self deny: (list includes: box2) . 
self assert: list isNotEmpty .
]

{ #category : #tests }
UiTests >> testCheckAllSameColorNeighbors [

	| box list box1 box2 box3 box4 |
	box := field grid at: 3 @ 4.
	box1 := field grid at: 3 @ 1.
	box2 := field grid at: 3 @ 2.
	box3 := field grid at: 3 @ 3.
	box4 := field grid at: 2 @ 4.

	list := box checkNeighbors.

	self assert: (list includes: box1).
	self assert: (list includes: box2).
	self assert: (list includes: box3).
	self deny: (list includes: box4).
	self assert: list isNotEmpty
]

{ #category : #tests }
UiTests >> testColor [

	self assert: (field grid at: 2 @ 1) color equals: Color red.
	self assert: (field grid at: 1 @ 1) color equals: Color green.
	self assert: (field grid at: 3 @ 1) color equals: Color magenta.
	self assert: (field grid at: 4 @ 1) color equals: Color blue.
]

{ #category : #'helpers for setup' }
UiTests >> testHasSameColorAs [

	| box1 box2 box3 |
	box1 := field grid at: 2 @ 1.
	box2 := field grid at: 3 @ 2.
	box3 := field grid at: 2 @ 2.

	self deny: (box1 hasSameColorAs: box2).
	self assert: (box1 hasSameColorAs: box3)
]

{ #category : #tests }
UiTests >> testRandomLaunchLevel01 [

	| board |
	board := MtBoardElement launchWith: MtBoard level01.
	self assert: board children first children size equals: 35.
]
