Class {
	#name : #MtBoard,
	#superclass : #MygBoard,
	#category : #MatchIt
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
			   width: 7
			   height: 5
			   tabulate: [ :column :row | MtBoxes randomLaunch ])


]

{ #category : #'as yet unclassified' }
MtBoard class >> level02 [ [

	^ self createBoardMatrix: (CTNewArray2D
			   width: 13
			   height: 10
			   tabulate: [ :column :row | MtBoxes randomLaunch ])
]
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

{ #category : #initialization }
MtBoard >> width [ 

	^ grid width
]
