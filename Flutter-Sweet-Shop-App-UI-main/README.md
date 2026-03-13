# Milica & Anita Sweet Shop App

Flutter mobile app UI projekat,radile: Milica Kostic i Anita Mijatovic.

## Izmene
- Uredjeni nazivi prodavnica/map sekcije
- Dodato web ucitavanje podataka kroz repository sloj (`http`), uz fallback na lokalne podatke.
- Osvezeni nazivi sekcija i proizvoda.

## Arhitektura podataka
- `remote`: `lib/features/home_feature/data/data_source/remote/web_products_service.dart`
- `repository`: `lib/features/home_feature/data/repository/product_feed_repository.dart`
- UI koristi repository u `products_list.dart` i automatski prelazi na lokalne podatke ako web source nije dostupan.

## Pokretanje
1. `flutter pub get`
2. `flutter run`

## Napomena
Ovo je Flutter projekat, pa moze da radi kao mobilna aplikacija (Android/iOS). U ovom repou postoji i `web/` folder, tako da moze i Flutter Web build.
