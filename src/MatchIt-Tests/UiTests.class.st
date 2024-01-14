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
	matrix at: 1 @ 3 put: MtBox createRed.
	matrix at: 1 @ 4 put: MtBox createGreen.
	matrix at: 2 @ 1 put: MtBox createRed.
	matrix at: 2 @ 2 put: MtBox createRed.
	matrix at: 2 @ 3 put: MtBox createRed.
	matrix at: 2 @ 4 put: MtBox createRed.
	matrix at: 3 @ 1 put: MtBox createMagenta.
	matrix at: 3 @ 2 put: MtBox createMagenta.
	matrix at: 3 @ 3 put: MtBox createRed.
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
UiTests >> testBoardIsEmpty [
	" green *red magenta blue                                       
     green *red magenta blue   
     *red  *red1 *red    blue                                       
     green *red magenta blue "

	(field grid at: 2 @ 3) click.
	" green *red magenta blue                                       uncolored uncolored uncolored blue
     green *red magenta blue    after eliminating the red1 box =>   green     uncolored magenta   blue
     *red  *red1 *red    blue                                       green     uncolored magenta   blue
     green *red magenta blue                                       green     uncolored magenta   blue"
	(field grid at: 1 @ 2) click.
	"eliminating the green boxes in first column"
	(field grid at: 3 @ 3) click.
	"eliminating the magenta boxes in third column"
	(field grid at: 4 @ 3) click.
	"eliminating the blue boxes in the forth column"
	self assert: field isEmpty
]

{ #category : #tests }
UiTests >> testBoxSameColorNeighbors [

	| box list box1 box2 |
	box := field grid at: 2 @ 3.
	box1 := field grid at: 2 @ 2.
	box2 := field grid at: 3 @ 2.

	list := box sameColorNeighbors.
	self assert: (list includes: box1).
	self deny: (list includes: box2).
	self assert: list isNotEmpty
]

{ #category : #tests }
UiTests >> testCheckAllSameColorNeighbors [
	" green red magenta blue 
     green red magenta blue
     red   red red     blue
     green red magenta blue"

	| box list box1 box2 box3 box4 |
	box := field grid at: 2 @ 2. "red box in the second color and second row "
	box1 := field grid at: 2 @ 1.
	box2 := field grid at: 3 @ 3.
	box3 := field grid at: 1 @ 3.
	box4 := field grid at: 4 @ 4.

	list := box checkNeighbors. "this should return all the 6 red neighbors "
	self assert: list size equals: 6.

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
	self assert: (field grid at: 4 @ 1) color equals: Color blue
]

{ #category : #tests }
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
	self assert: board children first children size equals: 81
]

{ #category : #tests }
UiTests >> testRemoveSameColorNeighbors [
	" green *red magenta blue 
     green *red magenta blue
     *red  *red *red    blue
     green *red magenta blue"

	| box neighbors |
	box := field grid at: 2 @ 1.
	neighbors := box checkNeighbors.
	box board removeBoxList: neighbors.
	self assert: (field grid at: 1 @ 3) isUncoloredBox.
	self deny: (field grid at: 4 @ 3) isUncoloredBox
]

{ #category : #tests }
UiTests >> testTopBox [
	" green *red magenta blue 
     green *red magenta blue
     *red  *red *red    blue
     green *red magenta blue"

	| box |
	box := field grid at: 2 @ 1.
	self assert: box topBox isRedBox.
	self deny: box topBox isBlueBox
]

{ #category : #tests }
UiTests >> testfallingBoxesAfterEliminatingSameColorSiblings [
	" green *red magenta blue                                       uncolored uncolored uncolored blue
     green *red magenta blue    after eliminating the red box =>   green     uncolored magenta   blue
     *red  *red *red    blue                                       green     uncolored magenta   blue
     green *red magenta blue                                       green     uncolored magenta   blue"

	| box neighbors |
	box := field grid at: 2 @ 1.
	self assert: (field grid at: 1 @ 4) topBox isRedBox.
	self assert: (field grid at: 2 @ 2) isRedBox.
	self assert: (field grid at: 4 @ 3) isBlueBox.

	"after clicking on the  red box at 2@1 "
	neighbors := box checkNeighbors.
	box board removeBoxList: neighbors.
	box board updateBoard.
	self assert: (field grid at: 1 @ 4) topBox isGreenBox.
	self assert: (field grid at: 2 @ 2) isUncoloredBox.
	self assert: (field grid at: 4 @ 3) isBlueBox
]
