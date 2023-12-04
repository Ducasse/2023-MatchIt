Class {
	#name : #BaselineOfMatchIt,
	#superclass : #BaselineOf,
	#category : #BaselineOfMatchIt
}

{ #category : #baselines }
BaselineOfMatchIt >> baseline: spec [
	<baseline>
	spec
		baseline: 'Toplo'
		with: [ spec repository: 'github://plantec/Toplo:573bdc3e26b9a93954889db16fed838452034a16/src' ].

	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src' ].


	spec baseline: 'ContainersArray2D' with: [
		spec repository:
			'github://pharo-containers/Containers-Array2D:master/src' ].


	spec
		package: 'MygCore'
		with: [ spec requires: #( 'Bloc' 'Toplo' 'ContainersArray2D' ) ];
		package: 'MygCore-Tests' with: [ spec requires: #( 'MygCore' ) ];
		package: 'MatchIt' with: [ spec requires: #( 'MygCore' ) ];
		package: 'MatchIt-Tests'
		with: [ spec requires: #( 'MatchIt' ) ];
		package: 'Myg-Compass';
		yourself
]
