Class {
	#name : #MtBoard,
	#superclass : #MygBoard,
	#category : #'MatchIt-Model'
}

{ #category : #'as yet unclassified' }
MtBoard class >> createBoardMatrix: aMatrix [ 

	^ self new
		  configureGrid: aMatrix;
		  yourself

]

{ #category : #'as yet unclassified' }
MtBoard class >> level01 [ 

	^ self createBoardMatrix: (CTNewArray2D
			   width: 9
			   height: 9
			   tabulate: [ :column :row | MtBox randomLaunch ])


]

{ #category : #'as yet unclassified' }
MtBoard class >> level02 [ 

	^ self createBoardMatrix: (CTNewArray2D
			   width: 16
			   height: 16
			   tabulate: [ :column :row | MtBox randomLaunch ])

]

{ #category : #'as yet unclassified' }
MtBoard class >> mat2x2 [

	| matrix |
	matrix := CTNewArray2D width: 2 height: 2.
	matrix at: 1 @ 1 put: MtBox createGreen.
	matrix at: 1 @ 2 put: MtBox createMagenta.
	matrix at: 2 @ 1 put: MtBox createRed.
	matrix at: 2 @ 2 put: MtBox createBlue.

	^ self createBoardMatrix: matrix
]

{ #category : #initialization }
MtBoard >> clickOnBox: box [ 

	self grid space removeChild: box
]

{ #category : #initialization }
MtBoard >> height [ 

	^ grid height
]

{ #category : #initialization }
MtBoard >> initialize [ 
super initialize

]

{ #category : #'as yet unclassified' }
MtBoard >> replaceBox: aList [

	aList do: [ :each | self grid at: each position put: UncoloredBox ] 
]

{ #category : #'as yet unclassified' }
MtBoard >> updateBoard: aList [
aList do: [:each| self grid at: each position put: UncoloredBox  ].


]

{ #category : #initialization }
MtBoard >> width [ 

	^ grid width
]
