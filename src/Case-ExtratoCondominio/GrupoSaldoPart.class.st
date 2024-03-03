Class {
	#name : #GrupoSaldoPart,
	#superclass : #ExtratoPart,
	#instVars : [
		'title',
		'grupoRecebimento',
		'grupoPagamento',
		'currentGrupoItem'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
GrupoSaldoPart class >> canParse: aTrTag [
	^ aTrTag text includesSubstring: 'GRUPO DE SALDO'
]

{ #category : #'class initialization' }
GrupoSaldoPart class >> initialize [
	priority := 2.
]

{ #category : #'instance creation' }
GrupoSaldoPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| re grupoSaldoPart |
	
	re := 'GRUPO DE SALDO\:\s(.+)\sSaldo' asRegex.
	re search: aTrTag text.
	re subexpression: 2.
	
	grupoSaldoPart := self new
		title: (re subexpression: 2);
		parentDocument: aDocument.
		
	aDocument currentGrupoSaldo: grupoSaldoPart.
	^ grupoSaldoPart
]

{ #category : #'accessing - class hierarchy' }
GrupoSaldoPart class >> priority [
	^ 2
]

{ #category : #accessing }
GrupoSaldoPart >> currentGrupoItem [
	^ currentGrupoItem
]

{ #category : #accessing }
GrupoSaldoPart >> currentGrupoItem: aGrupoItem [
	currentGrupoItem := aGrupoItem
]

{ #category : #accessing }
GrupoSaldoPart >> currentGrupoSaldo [
	^ currentGrupoItem
]

{ #category : #accessing }
GrupoSaldoPart >> grupoPagamento [
	^ grupoPagamento
]

{ #category : #accessing }
GrupoSaldoPart >> grupoPagamento: aGrupoPagamentoPart [

	grupoPagamento := aGrupoPagamentoPart.
	currentGrupoItem := aGrupoPagamentoPart
]

{ #category : #accessing }
GrupoSaldoPart >> grupoRecebimento [
	^ grupoRecebimento
]

{ #category : #accessing }
GrupoSaldoPart >> grupoRecebimento: aGrupoRecebimentoPart [

	grupoRecebimento := aGrupoRecebimentoPart.
	currentGrupoItem := aGrupoRecebimentoPart
]

{ #category : #accessing }
GrupoSaldoPart >> title [
	^ title
]

{ #category : #'instance creation' }
GrupoSaldoPart >> title: aString [
	title := aString 
]
