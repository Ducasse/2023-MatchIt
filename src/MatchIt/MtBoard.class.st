Class {
	#name : #MtBoard,
	#superclass : #MygBoard,
	#category : #'MatchIt-Model'
}

{ #category : #'instance creation' }
MtBoard class >> createBoardMatrix: aMatrix [

	^ self new
		  configureGrid: aMatrix;
		  yourself
]

{ #category : #'instance creation' }
MtBoard class >> level01 [

	^ self createBoardMatrix: (CTNewArray2D
			   width: 9
			   height: 9
			   tabulate: [ :column :row | MtBox randomLaunch ])
]

{ #category : #'instance creation' }
MtBoard class >> level02 [

	^ self createBoardMatrix: (CTNewArray2D
			   width: 16
			   height: 16
			   tabulate: [ :column :row | MtBox randomLaunch ])
]

{ #category : #'instance creation' }
MtBoard class >> mat2x2 [

	| matrix |
	matrix := CTNewArray2D width: 2 height: 2.
	matrix at: 1 @ 1 put: MtBox createGreen.
	matrix at: 1 @ 2 put: MtBox createMagenta.
	matrix at: 2 @ 1 put: MtBox createRed.
	matrix at: 2 @ 2 put: MtBox createBlue.

	^ self createBoardMatrix: matrix
]

{ #category : #accessing }
MtBoard >> height [

	^ grid height
]

{ #category : #testing }
MtBoard >> isEmpty [

	^ self grid contents anySatisfy: [ :box | box isUncoloredBox ]
]

{ #category : #actions }
MtBoard >> removeBoxList: aList [

	aList do: [ :each |
		grid at: each position x @ each position y put: (UncoloredBox new
				 position: each position x @ each position y;
				 board: self) ]
]

{ #category : #actions }
MtBoard >> updateBoard [

	self grid fromBottomToTopFromLeftToRightDo: [ :box |
		box topBox ifNotNil: [
			(box isUncoloredBox and: [ box topBox isUncoloredBox not ])
				ifTrue: [
					self grid
						atColumn: box position x
						atRow: box position y
						put: box topBox.
					self grid
						atColumn: box topBox position x
						atRow: box topBox position y
						put: (UncoloredBox new
								 position: box topBox position x @ box topBox position y;
								 board: self) ] ] ]
]

{ #category : #accessing }
MtBoard >> width [

	^ grid width
]
