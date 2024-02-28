Class {
	#name : #ExtratoPart,
	#superclass : #Object,
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
ExtratoPart class >> newFromTrTag: aTrTag [
	self subclassResponsibility
]

{ #category : #'accessing - class hierarchy' }
ExtratoPart class >> priority [
	^ priority
]
