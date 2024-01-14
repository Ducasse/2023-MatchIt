Class {
	#name : #UncoloredBox,
	#superclass : #MtBox,
	#category : #'MatchIt-Model'
}

{ #category : #accessing }
UncoloredBox >> color [

	^ Color transparent
]

{ #category : #accessing }
UncoloredBox >> initialize [
super initialize.
	value := 0
]

{ #category : #testing }
UncoloredBox >> isUncoloredBox [

	^ true
]
