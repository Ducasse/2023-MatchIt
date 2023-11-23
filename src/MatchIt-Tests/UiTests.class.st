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
	matrix at: 1 @ 1 put: MtBoxes createGreen.
	matrix at: 1 @ 2 put: MtBoxes createGreen.
	matrix at: 1 @ 3 put: MtBoxes createGreen.
	matrix at: 1 @ 4 put: MtBoxes createGreen.
	matrix at: 2 @ 1 put: MtBoxes createRed.
	matrix at: 2 @ 2 put: MtBoxes createRed.
	matrix at: 2 @ 3 put: MtBoxes createRed.
	matrix at: 2 @ 4 put: MtBoxes createRed.
	matrix at: 3 @ 1 put: MtBoxes createMagenta.
	matrix at: 3 @ 2 put: MtBoxes createMagenta.
	matrix at: 3 @ 3 put: MtBoxes createMagenta.
	matrix at: 3 @ 4 put: MtBoxes createMagenta.
	matrix at: 4 @ 1 put: MtBoxes createBlue.
	matrix at: 4 @ 2 put: MtBoxes createBlue.
	matrix at: 4 @ 3 put: MtBoxes createBlue.
	matrix at: 4 @ 4 put: MtBoxes createBlue.

	field := MtBoard createBoardMatrix: matrix
]

{ #category : #tests }
UiTests >> test2x2MatDifferentColors [

	| board |
	board := MtBoardElement launchWith: MtBoard mat2x2.
	
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
UiTests >> testLeftAndRightSibling [

	| boardGame space boxElm1 boxElm2 |
	boardGame := MtBoardElement launchWith: field.
	space := boardGame root childAt: 1.
	boxElm1 := (space board grid at: 1 @ 1) surface.
	boxElm2 := (space board grid at: 2 @ 1) surface.

	self assert: boxElm2 leftBox equals: boxElm1 box.
	self assert: boxElm1 rightBox equals: boxElm2 box.
]

{ #category : #tests }
UiTests >> testRandomLaunchLevel01 [

	| board |
	board := MtBoardElement launchWith: MtBoard level01
	
]

{ #category : #tests }
UiTests >> testTopAndBottomSibling [

	| boardGame space boxElm1 boxElm2 |
	boardGame := MtBoardElement launchWith: field.
	space := boardGame root childAt: 1.
	boxElm1 := (space board grid at: 1 @ 1) surface.
	boxElm2 := (space board grid at: 1 @ 2) surface.

	self assert: boxElm1 bottomBox equals: boxElm2 box.
		self assert: boxElm2 onTopBox equals: boxElm1 box.
	self assert: boxElm1 bottomBox color equals: Color green
]
