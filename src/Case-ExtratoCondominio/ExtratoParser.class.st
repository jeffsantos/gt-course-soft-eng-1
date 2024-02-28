Class {
	#name : #ExtratoParser,
	#superclass : #Object,
	#instVars : [
		'allTRTags'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #'instance creation' }
ExtratoParser class >> fromFile: aFileReference yearMonth: aString [
	| soup tableTag |
	soup := Soup fromString: aFileReference contents.
	tableTag := (soup findAllTags: 'table') first.
	
	^ self new allTRTags: (tableTag findAllTags: 'tr').
]

{ #category : #accessing }
ExtratoParser >> allTRTags: anObject [ 
	allTRTags := anObject
]

{ #category : #parsing }
ExtratoParser >> parse: aTrTag [
	self partClasses
		detect: [ :subClass | 
			(subClass canParse: aTrTag)
				ifTrue: [ ^ subClass newFromTrTag: aTrTag ] ]
]

{ #category : #subclassing }
ExtratoParser >> partClasses [
	^ ExtratoPart allSubclasses
			sorted: [:class1 :class2 | class1 priority < class2 priority ]

]
