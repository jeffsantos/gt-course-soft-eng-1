Class {
	#name : #ExtratoDocument,
	#superclass : #Object,
	#instVars : [
		'condominio',
		'currentGrupoSaldo',
		'gruposSaldo'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #accessing }
ExtratoDocument >> condominio [
	^ condominio
]

{ #category : #accessing }
ExtratoDocument >> condominio: anObject [
	condominio := anObject
]

{ #category : #accessing }
ExtratoDocument >> currentGrupoSaldo [
	^ currentGrupoSaldo
]

{ #category : #accessing }
ExtratoDocument >> currentGrupoSaldo: aGrupoSaldoPart [
	currentGrupoSaldo := aGrupoSaldoPart.
	gruposSaldo add: aGrupoSaldoPart
]

{ #category : #accessing }
ExtratoDocument >> gruposSaldo [
	^ gruposSaldo
]

{ #category : #initialization }
ExtratoDocument >> initialize [
	super initialize.
	
	gruposSaldo := OrderedCollection new.
]
