Class {
	#name : #CondominioPart,
	#superclass : #ExtratoPart,
	#instVars : [
		'periodoStr',
		'startDate'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
CondominioPart class >> canParse: aTrTag [
	^ aTrTag text includesSubstring: 'Extrato Mensal'
]

{ #category : #'class initialization' }
CondominioPart class >> initialize [
	super initialize.
	priority := 1
]

{ #category : #'instance creation' }
CondominioPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| condominioPart |
	
	condominioPart := self new
		periodoStr: ((aTrTag text 
							allRegexMatches: '[0-9].*/[0-9].*/[0-9].*') first 
								removeSuffix: (Character cr asString,
											   Character cr asString));
		parentDocument: aDocument.
		
	condominioPart startDate: (self toDate:(condominioPart periodoStr allRegexMatches: '^[0-9]+\/[0-9]+\/[0-9]+') first).
		
	aDocument condominio: condominioPart.
	^ condominioPart
]

{ #category : #accessing }
CondominioPart >> periodoStr [
	^ periodoStr
]

{ #category : #accessing }
CondominioPart >> periodoStr: aString [
	periodoStr := aString 
]

{ #category : #accessing }
CondominioPart >> startDate [
	^ startDate
]

{ #category : #accessing }
CondominioPart >> startDate: aDate [
	startDate := aDate
]
