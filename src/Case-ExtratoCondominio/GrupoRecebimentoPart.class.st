Class {
	#name : #GrupoRecebimentoPart,
	#superclass : #ExtratoPart,
	#instVars : [
		'title',
		'items'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
GrupoRecebimentoPart class >> canParse: aTrTag [
	^ aTrTag text includesSubstring: 'RECEBIMENTOS'
]

{ #category : #'class initialization' }
GrupoRecebimentoPart class >> initialize [
	priority := 3
]

{ #category : #'instance creation' }
GrupoRecebimentoPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| grupoRecebimento |
	
	grupoRecebimento := self new
		title: 'RECEBIMENTOS';
		parentDocument: aDocument.
		
	(aDocument currentGrupoSaldo) grupoRecebimento: grupoRecebimento.
	^ grupoRecebimento
]

{ #category : #'accessing - class hierarchy' }
GrupoRecebimentoPart class >> priority [
	^ 3
]

{ #category : #adding }
GrupoRecebimentoPart >> addItem: anItem [
	items add: anItem
]

{ #category : #initialization }
GrupoRecebimentoPart >> initialize [
	items := OrderedCollection new.
]

{ #category : #accessing }
GrupoRecebimentoPart >> items [
	^ items
]

{ #category : #accessing }
GrupoRecebimentoPart >> title: aString [
	title:= aString
]
