Class {
	#name : #GrupoPagamentoPart,
	#superclass : #GrupoItemPart,
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
GrupoPagamentoPart class >> canParse: aTrTag [
	^ aTrTag text includesSubstring: 'PAGAMENTOS'
]

{ #category : #'class initialization' }
GrupoPagamentoPart class >> initialize [
	super initialize.
	priority := 4
]

{ #category : #'class initialization' }
GrupoPagamentoPart class >> newFromTrTag: aTrTag withDocument: aDocument [

	| grupoPagamento |
	
	grupoPagamento := self new
		title: 'PAGAMENTOS';
		parentDocument: aDocument.
		
	(aDocument currentGrupoSaldo) grupoPagamento: grupoPagamento.
	^ grupoPagamento
]
