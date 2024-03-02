Class {
	#name : #GrupoPagamentoPart,
	#superclass : #ExtratoPart,
	#instVars : [
		'title',
		'items'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
GrupoPagamentoPart class >> canParse: aTrTag [
	^ aTrTag text includesSubstring: 'PAGAMENTOS'
]

{ #category : #'class initialization' }
GrupoPagamentoPart class >> initialize [
	priority := 4
]

{ #category : #'instance creation' }
GrupoPagamentoPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| grupoPagamento |
	
	grupoPagamento := self new
		title: 'PAGAMENTOS';
		parentDocument: aDocument.
		
	(aDocument currentGrupoSaldo) grupoPagamento: grupoPagamento.
	^ grupoPagamento
]

{ #category : #'accessing - class hierarchy' }
GrupoPagamentoPart class >> priority [
	^ 5
]

{ #category : #adding }
GrupoPagamentoPart >> addItem: anItem [
	items add: anItem
]

{ #category : #initialization }
GrupoPagamentoPart >> initialize [
	items := OrderedCollection new.
]

{ #category : #accessing }
GrupoPagamentoPart >> items [
	^ items
]

{ #category : #accessing }
GrupoPagamentoPart >> title: aString [
	title:= aString
]
