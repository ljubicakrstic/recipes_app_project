# Sajt sa receptima

### Tehnologije:

1. react 16.13.1
2. react-router-dom 5.2.0
3. axios 0.20.0
4. mysql 2.18.1
5. express 4.17.1
6. node 12.18.2


### Instalacija projekata:

Prethodno potrebno instalirati NodeJS (v12.14.0 ili novija) i nodemon (globalno)

1. Klonirati repozitorijum
2. npm install u client folderu
3. npm install u root-u

### Instalacija baze:

Potrebno je instalirati WAMP, LAMP ili XAMP server. 

Skriptu pod nazivom database.sql iz ovog repozitorijuma otvoriti u MySQL Workbenchu, ili drugom alatu za rad sa bazama podataka. Izvršiti skriptu (execute).

U package.json fajlu na serverskoj strani (u rootu) promeniti username i password, u skladu sa lokalnim podešavanjima. 

### Pokretanje projekta:

1. ```npm run dev```
    - Pokreće server i klijentsku stranu istovremeno
    - Otvoriti http://localhost:3000/ u pretraživaču.

2. Za logovanje na stranicu potrebno je uneti: 
    - username: ljuba
    - password: 123

### Karakteristika aplikacije:

    - Mogućnost čitanja i pretraživanja recepata po više kategorija
    - Mogućnost logovanja i registracije novih korisnika
    - Mogućnost dodavanja novih recepata (samo za ulogovane korisnike)
