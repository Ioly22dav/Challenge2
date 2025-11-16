# English Version

# Todoist Project (Challenge2)

This project is a simple "To-Do list" application created with **SwiftUI**, inspired by the basic functionalities of Todoist. The app allows users to manage a list of tasks, add new ones, mark them as completed, and assign priorities.

## Key Features

The project implements the following features:

* **Task Management:**
    * Display a list of tasks in the "Inbox" view.
    * **Add** new tasks via a modal view (`AddTaskModalView`).
    * **Complete** a task (by striking it out and changing the icon).
    * **Delete** individual tasks (via swipe or context menu).

* **Navigation:**
    * The app uses a `TabView` (`ContentView`) as its main structure, with sections for:
        * Inbox (the main screen)
        * Today
        * Upcoming
        * Browse

* **Data Model (`Task.swift`):**
    * Each `Task` has an ID, a name (`compito`), a completion status (`isCompleted`), and an optional priority.
    * Priorities (`TaskPriority`) are defined as `high`, `medium`, and `low`, each with a specific color and name (e.g., "priority 1" for high).

* **Bulk Editing (`SelectTasksView.swift`):**
    * A full-screen view allows users to **select multiple tasks** simultaneously.
    * "Select All" / "Deselect All" functionality.
    * **Bulk actions** on selected tasks:
        * Delete
        * Assign a priority (High, Medium, Low)
        * Remove priority

## Project Structure

The project is organized into the following main files:

* `TodoistApp.swift`: The main entry point of the application (`@main`).
* `ContentView.swift`: Contains the main `TabView` which manages navigation between the different sections of the app.
* `Task.swift`: Defines the data model for `Task` and the `TaskPriority` enum.
* `InboxView.swift`: The main view that displays the list of tasks. It handles adding, deleting, and completing tasks.
* `AddTaskModalView.swift`: A modal view used to enter the text for a new task. Includes handling for cancellation with an alert if the field is not empty.
* `SelectTasksView.swift`: A view for selecting and bulk-editing multiple tasks (deletion and priority setting).

## Technologies Used

* **SwiftUI:** Apple's declarative framework for building user interfaces.
* **Data Binding:** Extensive use of `@State`, `@Binding`, and `@Environment` to manage application state and data flow between views.

# Italian Version 

# Progetto Todoist (Challenge2)

Questo progetto è una semplice applicazione "To-Do list" creata con **SwiftUI**, ispirata alle funzionalità di base di Todoist. L'app consente agli utenti di gestire un elenco di attività, aggiungerne di nuove, contrassegnarle come completate e assegnare priorità.

## Funzionalità Principali

Il progetto implementa le seguenti funzionalità:

* **Gestione Task:**
    * Visualizzare un elenco di attività nella vista "Inbox".
    * **Aggiungere** nuove attività tramite una vista modale (`AddTaskModalView`).
    * **Completare** un'attività (barrandola e cambiando l'icona).
    * **Eliminare** singole attività (tramite swipe o menu contestuale).

* **Navigazione:**
    * L'app utilizza una `TabView` (`ContentView`) come struttura principale, con sezioni per:
        * Inbox (la schermata principale)
        * Today
        * Upcoming
        * Browse

* **Modello Dati (`Task.swift`):**
    * Ogni `Task` ha un ID, un nome (`compito`), uno stato di completamento (`isCompleted`) e una priorità opzionale.
    * Le priorità (`TaskPriority`) sono definite come `high`, `medium`, e `low`, ognuna con un colore e un nome specifico (es. "priority 1" per alta).

* **Modifica Multipla (`SelectTasksView.swift`):**
    * Una vista a schermo intero permette di **selezionare più attività** contemporaneamente.
    * Funzionalità "Seleziona Tutti" / "Deseleziona Tutti".
    * **Azioni in blocco** sulle attività selezionate:
        * Elimina
        * Assegna una priorità (Alta, Media, Bassa)
        * Rimuovi priorità

## Struttura del Progetto

Il progetto è organizzato nei seguenti file principali:

* `TodoistApp.swift`: Il punto di ingresso principale dell'applicazione (`@main`).
* `ContentView.swift`: Contiene la `TabView` principale che gestisce la navigazione tra le diverse sezioni dell'app.
* `Task.swift`: Definisce il modello dati per `Task` e l'enum `TaskPriority`.
* `InboxView.swift`: La vista principale che mostra l'elenco delle attività. Gestisce l'aggiunta, l'eliminazione e il completamento dei task.
* `AddTaskModalView.swift`: Una vista modale utilizzata per inserire il testo di una nuova attività. Include una gestione per l'annullamento con avviso se il campo non è vuoto.
* `SelectTasksView.swift`: Una vista per la selezione e la modifica in blocco di più attività (eliminazione e impostazione della priorità).

## Tecnologie Utilizzate

* **SwiftUI:** Il framework dichiarativo di Apple per la costruzione di interfacce utente.
* **Data Binding:** Utilizzo estensivo di `@State`, `@Binding` e `@Environment` per gestire lo stato dell'applicazione e il passaggio dei dati tra le viste.
