Class {
	#name : #RedBox,
	#superclass : #MtBox,
	#category : #'MatchIt-Model'
}

{ #category : #accessing }
RedBox class >> color [ 
^ Color red 

]

{ #category : #accessing }
RedBox >> color [ 
	^ Color red
]

{ #category : #testing }
RedBox >> isRedBox [
	^true.
]
