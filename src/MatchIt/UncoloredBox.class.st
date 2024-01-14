Class {
	#name : #UncoloredBox,
	#superclass : #MtBox,
	#category : #'MatchIt-Model'
}

{ #category : #accessing }
UncoloredBox >> color [

	^ Color transparent
]

{ #category : #initialization }
UncoloredBox >> initialize [

	super initialize.
	value := 0
]

{ #category : #testing }
UncoloredBox >> isUncoloredBox [

	^ true
]
