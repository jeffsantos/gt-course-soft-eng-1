Class {
	#name : #GrupoItemPart,
	#superclass : #ExtratoPart,
	#instVars : [
		'title',
		'items'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #asserting }
GrupoItemPart class >> canParse: aTrTag [
	^ false
]

{ #category : #'class initialization' }
GrupoItemPart class >> initialize [
	super initialize.
	priority := 99
]

{ #category : #adding }
GrupoItemPart >> addItem: anItem [
	items add: anItem
]

{ #category : #initialization }
GrupoItemPart >> initialize [
	items := OrderedCollection new.
]

{ #category : #accessing }
GrupoItemPart >> items [
	^ items
]

{ #category : #accessing }
GrupoItemPart >> title: aString [
	title:= aString
]

{ #category : #accessing }
GrupoItemPart >> total [
	| col |
	col := self items collect: [ :each | each valor ].
	^ col sum
]
