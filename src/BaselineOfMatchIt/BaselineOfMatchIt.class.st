Class {
	#name : #BaselineOfMatchIt,
	#superclass : #BaselineOf,
	#category : #BaselineOfMatchIt
}

{ #category : #baselines }
BaselineOfMatchIt >> baseline: spec [

	<baseline>
	spec
		baseline: 'Myg'
		with: [ spec repository: 'github://Ducasse/Myg:v1.0.0/src' ].

	spec

		package: 'MatchIt' 
		with: [ spec requires: #( 'Myg' ) ];
		package: 'MatchIt-Tests'
		with: [ spec requires: #( 'MatchIt' ) ];
		yourself
]
