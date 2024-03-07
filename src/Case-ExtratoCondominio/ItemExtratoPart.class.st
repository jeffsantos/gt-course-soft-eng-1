Class {
	#name : #ItemExtratoPart,
	#superclass : #ExtratoPart,
	#instVars : [
		'dia',
		'conta',
		'descricao',
		'ref',
		'valor',
		'complemento'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #accessing }
ItemExtratoPart class >> canParse: aTrTag [
	| re |
	re := '^[0-9]+\.[0-9]+\.[0-9]+\W' asRegex.
		
	^ re search: aTrTag text
]

{ #category : #'class initialization' }
ItemExtratoPart class >> initialize [
	super initialize.
	priority := 5
]

{ #category : #'instance creation' }
ItemExtratoPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| itemPart columns |
	
	itemPart := self new
		parentDocument: aDocument.
		
	columns := aTrTag findAllTags: 'td'.
	
	itemPart dia: (self toDate: (columns at: 1) text).
	itemPart conta: (columns at: 2) text.
	itemPart descricao: (columns at: 3) text.
	itemPart ref: (columns at: 4) text.
	itemPart valor: (self toNumber: (columns at: 5) text).
	itemPart complemento: (columns at: 6) text.
	
	aDocument currentGrupoSaldo currentGrupoItem addItem: itemPart.

	^ itemPart

]

{ #category : #accessing }
ItemExtratoPart >> complemento [
	^ complemento
]

{ #category : #accessing }
ItemExtratoPart >> complemento: anObject [
	complemento := anObject
]

{ #category : #accessing }
ItemExtratoPart >> conta [
	^ conta
]

{ #category : #accessing }
ItemExtratoPart >> conta: anObject [
	conta := anObject
]

{ #category : #accessing }
ItemExtratoPart >> descricao [
	^ descricao
]

{ #category : #accessing }
ItemExtratoPart >> descricao: anObject [
	descricao := anObject
]

{ #category : #accessing }
ItemExtratoPart >> dia [
	^ dia
]

{ #category : #accessing }
ItemExtratoPart >> dia: anObject [
	dia := anObject
]

{ #category : #initialization }
ItemExtratoPart >> initialize [ 
	super initialize.
]

{ #category : #accessing }
ItemExtratoPart >> ref [
	^ ref
]

{ #category : #accessing }
ItemExtratoPart >> ref: anObject [
	ref := anObject
]

{ #category : #accessing }
ItemExtratoPart >> valor [
	^ valor
]

{ #category : #accessing }
ItemExtratoPart >> valor: anObject [
	valor := anObject
]
