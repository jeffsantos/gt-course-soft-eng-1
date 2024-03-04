Class {
	#name : #ExtratoPart,
	#superclass : #Object,
	#instVars : [
		'parentDocument'
	],
	#classInstVars : [
		'priority'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
ExtratoPart class >> canParse: aTrTag [
	self subclassResponsibility
]

{ #category : #'instance creation' }
ExtratoPart class >> newFromTrTag: aTrTag withDocument: aDocument [
	self subclassResponsibility
]

{ #category : #'accessing - class hierarchy' }
ExtratoPart class >> priority [
	^ priority
]

{ #category : #accessing }
ExtratoPart >> parentDocument: aDocument [
	parentDocument := aDocument
]
