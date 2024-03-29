Class {
	#name : #BaselineOfGtCourseSoftEng1,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtCourseSoftEng1
}

{ #category : #loading }
BaselineOfGtCourseSoftEng1 class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-course-soft-eng-1' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #accessing }
BaselineOfGtCourseSoftEng1 class >> renameLepiter [
	LeDatabasesRegistry defaultLogicalDatabase databases 
		detect: [ :aDatabase | aDatabase databaseName includesSubstring: 'gt-course-soft-eng-1' ] 
		ifFound: [ :aDatabase | aDatabase databaseName: 'Course: Software Engineering 1']
]

{ #category : #baseline }
BaselineOfGtCourseSoftEng1 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtCourseSoftEng1'
		]
]
