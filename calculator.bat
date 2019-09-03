@echo off

set /p zahl1="Zahl1: "
set /p zahl2="Zahl2: "
set /a ergebnisSumme=%zahl1% + %zahl2%
set /a ergebnisProdukt=%zahl1% * %zahl2%
set /a ergebnisQuotient=%zahl1% / %zahl2%
set /a ergebnisDifferenz=%zahl1% - %zahl2%


echo Summe = %ergebnisSumme%
echo Produkt = %ergebnisProdukt%
echo Quotient = %ergebnisQuotient%
echo Differenz = %ergebnisDifferenz%

pause >NUL
