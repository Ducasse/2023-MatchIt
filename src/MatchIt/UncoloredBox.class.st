Class {
	#name : #UncoloredBox,
	#superclass : #MtBox,
	#category : #'MatchIt-Model'
}

{ #category : #testing }
UncoloredBox class >> isUncoloredBox [
	^true.
]

{ #category : #'as yet unclassified' }
UncoloredBox class >> topBox [

| position |
(((self position x) between: 1 and: self board grid width) and: ((self position y-1) between: 1 and: self board grid height)) ifTrue: 
[^self board grid atColumn: position x  atRow: position y -1 ] 

]

{ #category : #accessing }
UncoloredBox >> color [

	^ Color transparent .
]

{ #category : #accessing }
UncoloredBox >> initialize [
super initialize.
	value := 0
]

{ #category : #testing }
UncoloredBox >> isUncoloredBox [ 
^true 
]
