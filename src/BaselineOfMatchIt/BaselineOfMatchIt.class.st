Class {
	#name : #BaselineOfMatchIt,
	#superclass : #BaselineOf,
	#category : #BaselineOfMatchIt
}

{ #category : #baselines }
BaselineOfMatchIt >> baseline: spec [

	<baseline>
	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src' ].


	spec baseline: 'ContainersArray2D' with: [
		spec repository:
			'github://pharo-containers/Containers-Array2D:master/src' ].
		
	spec baseline: 'Myg' with: [
		spec repository:
			'github://Ducasse/Myg:v1.0.1/src' ].
	spec
		package: 'MatchIt'
		with: [ spec requires: #( 'Bloc' 'Myg' 'ContainersArray2D' ) ];
		
		package: 'MatchIt-Tests' 
		with: [ spec requires: #( 'MatchIt' ) ];
	
		yourself
]
