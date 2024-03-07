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

{ #category : #'private - converting' }
ExtratoPart class >> toDate: aString [
	| dateParts day month |
	dateParts := ('/' split:aString).
	day := dateParts at: 1.
	month := dateParts at: 2.
	dateParts at: 2 put: day.
	dateParts at: 1 put: month.
	^ ('/' join: dateParts) asDate.
]

{ #category : #'private - converting' }
ExtratoPart class >> toNumber: aString [
	^ (aString \ ',') asNumber
]

{ #category : #accessing }
ExtratoPart >> parentDocument: aDocument [
	parentDocument := aDocument
]
