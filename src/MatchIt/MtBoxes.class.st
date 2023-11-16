Class {
	#name : #MtBoxes,
	#superclass : #MygAbstractBox,
	#instVars : [
		'color',
		'surface'
	],
	#category : #MatchIt
}

{ #category : #accessing }
MtBoxes >> color [
	SubclassResponsibility 
]

{ #category : #testing }
MtBoxes >> hasSameColorAs: aColoredBox [
	^self color = aColoredBox color
]

{ #category : #accessing }
MtBoxes >> surface [
	^surface
]

{ #category : #accessing }
MtBoxes >> surface: aBoxElm [
	surface := aBoxElm
]
