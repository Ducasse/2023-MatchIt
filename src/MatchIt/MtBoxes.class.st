Class {
	#name : #MtBoxes,
	#superclass : #MygAbstractBox,
	#instVars : [
		'color',
		'surface'
	],
	#category : #MatchIt
}

{ #category : #'as yet unclassified' }
MtBoxes class >> randomLaunch [
	^{
			BlueBox.
			GreenBox.
			MagentaBox.
			RedBox.} atRandom new 
]

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
