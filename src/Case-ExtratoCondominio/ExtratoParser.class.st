Class {
	#name : #ExtratoParser,
	#superclass : #Object,
	#instVars : [
		'allTRTags',
		'document'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #'instance creation' }
ExtratoParser class >> fromFile: aFileReference yearMonth: aString [
	| soup tableTag |
	soup := Soup fromString: aFileReference contents.
	tableTag := (soup findAllTags: 'table') first.
	
	^ self new 
		allTRTags: (tableTag findAllTags: 'tr').
]

{ #category : #accessing }
ExtratoParser >> allTRTags [
	^ allTRTags
]

{ #category : #accessing }
ExtratoParser >> allTRTags: anObject [ 
	allTRTags := anObject
]

{ #category : #parsing }
ExtratoParser >> parse [
	| aDoc |
	aDoc := ExtratoDocument new.
	
	Transcript clear.
	allTRTags doWithIndex: [ :each :index | 						
						| obj |
						Transcript show: index printString, ' '.
						obj := self parseTrTag: each withDocument: aDoc.
						Transcript show: obj printString.
						Transcript cr.].
	
	^ aDoc.	
]

{ #category : #parsing }
ExtratoParser >> parseTrTag: aTrTag withDocument: anExtratoDocument [
	| subClassParser |
	subClassParser := (self partClasses
						detect: [ :subClass | 
								(subClass canParse: aTrTag) ]
						ifNone: [nil]).
		
	subClassParser 
		ifNotNil: [^subClassParser newFromTrTag: aTrTag withDocument: anExtratoDocument]
		ifNil: [^nil]
]

{ #category : #parsing }
ExtratoParser >> parseTrTagOld: aTrTag withDocument: anExtratoDocument [
	self partClasses
		detect: [ :subClass | 
			(subClass canParse: aTrTag)
				ifTrue: [ 
						^ subClass newFromTrTag: aTrTag withDocument: anExtratoDocument] ]
]

{ #category : #subclassing }
ExtratoParser >> partClasses [
	^ ExtratoPart allSubclasses
			sorted: [:class1 :class2 | class1 priority < class2 priority ]

]
