Class {
	#name : #CondominioExtrator,
	#superclass : #Object,
	#instVars : [
		'driver'
	],
	#category : #'Case-ExtratoCondominio'
}

{ #category : #'as yet unclassified' }
CondominioExtrator class >> createWithDriver [
	^self new driver: (BPRemoteWebDriver withCapabilities: BPChromeOptions new)

]

{ #category : #'private - accessing pages' }
CondominioExtrator >> accessDashboardPage [
	| cover | 
	cover := (driver findElementsByCSSSelector: '.object-cover') first.
	cover click.
]

{ #category : #'private - accessing pages' }
CondominioExtrator >> accessDowloadExtratoPorMesPage [

	1 to: 12 do: [ :i |
		driver get: 'https://cipafacil.digital/extrato'.		
		3 seconds asDelay wait.
		
		self accessExtratoPorMesPage: i 
	]
]

{ #category : #'private - accessing pages' }
CondominioExtrator >> accessExtratoPorMesPage: i [

	"Extrato page - Set Date"
	self clickCalendar.
	self clickMonth: i.
	3 seconds asDelay wait.
	self extractExtratoPorMes.
	10 seconds asDelay wait
]

{ #category : #'private - accessing pages' }
CondominioExtrator >> accessLoginPage [
	| email password |

	driver get: 'https://cipafacil.digital/sign-in'.

	email := driver findElementByID: 'email'.
	password := driver findElementByID: 'password'.

	email clear.
	email sendKeys: self getUsername.
	password clear.
	password sendKeys: self getPassword.

	password sendKeys: (String with: BPKeys return).

	5 seconds asDelay wait.
]

{ #category : #'private - accessing pages' }
CondominioExtrator >> clickCalendar [

	| calendar |
	calendar := (driver findElementsByCSSSelector: '.mat-input-element')
		            first. "Extrato page - Set Date"
	calendar click
]

{ #category : #'private - accessing pages' }
CondominioExtrator >> clickMonth: i [

	| previousButton month |
	previousButton := (driver findElementsByCSSSelector:
		                   '.mat-calendar-previous-button') first.
	previousButton click.
	month := (driver findElementsByCSSSelector:
		          '.mat-calendar-body-cell-content') at: i.
	month click
]

{ #category : #extracting }
CondominioExtrator >> downloadExtratos [
	self accessLoginPage.
	self accessDashboardPage.
	self accessDowloadExtratoPorMesPage 
	
]

{ #category : #accessing }
CondominioExtrator >> driver [
	^ driver
]

{ #category : #accessing }
CondominioExtrator >> driver: aSeleniumDriver [
	driver := aSeleniumDriver
]

{ #category : #'private - extraction' }
CondominioExtrator >> extractExtratoPorMes [

	| exportButton |
	exportButton := (driver findElementsByCSSSelector:
		                 'span.mat-button-wrapper') third.
	exportButton click
]

{ #category : #'private - configuration' }
CondominioExtrator >> getCredentials: aString [

	| tokensJson dict | 
	tokensJson := 'D:\Users\jefferson\Google Drive\_tmp\tokens.json' asFileReference.
	dict := STON fromString: tokensJson contents.
	^ (dict at: 'cipawebsite') at: aString
]

{ #category : #'private - configuration' }
CondominioExtrator >> getPassword [

	^ self getCredentials: 'password'
]

{ #category : #'private - configuration' }
CondominioExtrator >> getUsername [

	^ self getCredentials: 'username'
]
