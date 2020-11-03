# README #

Klasa **aghdpl** (szablon dokumentu) została opracowana w celu ułatwienia studentom naszej Uczelni składania prac dyplomowych w systemie LaTeX. Odpowiednie opcje pozwalają na skład zarówno prac inżynierskich jak i magisterskich przez studentów wszystkich wydziałów AGH. Praca może zostać przygotowana w języku polskim lub angielskim.

Prezentowana wersja 4.0 jest zgodna z obowiązującym od roku akademickiego 2019/20 formatem przygotowania prac dyplomowych na Wydziale EAIiIB (zob. [Zasady dyplomowania](https://www.eaiib.agh.edu.pl/egzamin-dyplomowy-i-prace-dyplomowe/)).


## Autorzy ##

  * [Paweł Kłeczek](https://skos.agh.edu.pl/osoba/pawel-kleczek-8552.html)
  * [Grzegorz J. Nalepa](https://skos.agh.edu.pl/osoba/grzegorz-jacek-nalepa-5324.html)
  * [Marcin Szpyrka](https://skos.agh.edu.pl/osoba/marcin-szpyrka-5059.html)


## Pliki ##

Repozytorium zawiera zawiera:
  * plik aghdpl.cls z klasą dokumentu,
  * logo AGH w formacie JPG (potrzebne przy kompilacji programem _pdflatex_),
  * przykładowe pliki źródłowe ilustrujące wykorzystanie klasy _aghdpl_.


## Uwagi ##

  * Wszystkie pliki zostały zapisane w kodowaniu **UTF-8**.
  * Klasa została zoptymalizowana do pracy z programem **pdflatex**.
  * Skrypt do usuwania wiszących przyimków: [tex-fixer](https://github.com/Alexander3/tex-fixer) (autor: Aleksander Kawala)
  * Uwagi dotyczące działania klasy _aghdpl_ proszę przesyłać na adres e-mail: [pkleczek@agh.edu.pl](mailto:pkleczek@agh.edu.pl)


## Changelog ##

### v4.0 ###

Zmiany związane ze zmianami _Zasad dyplomowania_:
  * zmiana formatowania nazwy wydziału
  * usunięcie nazwy katedry
  * usunięcie _Oświadczenia o samodzielności pracy_ (obecnie dołączane jako osobny dokument)
  * zapewnienie odpowiedniej kolejność tytułów pracy w zależności od wersji językowej

Zmiany techniczne:
  * zmiana sposobu podawania opcji języka pracy, obecnie jako parametr słownikowy klasy (np. `[language=en]`), domyślnie `pl`
