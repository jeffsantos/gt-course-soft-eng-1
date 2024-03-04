Class {
	#name : #GrupoRecebimentoPart,
	#superclass : #GrupoItemPart,
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
GrupoRecebimentoPart class >> canParse: aTrTag [
	^ aTrTag text includesSubstring: 'RECEBIMENTOS'
]

{ #category : #'class initialization' }
GrupoRecebimentoPart class >> initialize [
	super initialize.
	priority := 3
]

{ #category : #'class initialization' }
GrupoRecebimentoPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| grupoRecebimento |
	
	grupoRecebimento := self new
		title: 'RECEBIMENTOS';
		parentDocument: aDocument.
		
	(aDocument currentGrupoSaldo) grupoRecebimento: grupoRecebimento.
	^ grupoRecebimento
]
