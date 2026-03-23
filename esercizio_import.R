y <- read.csv("data/2013.csv", sep = ",")
y

head(y) #prime 6 righe
tail(y) #ultime 6 righe
#se una riga è sbagliata, e ad esempio voglio considerare solo la riga dalla 1 
#alle 88, gli dico
#y <- y[1:88,] a sinistra le righe, a destra le colonne, se non specifico
#niente mi tiene tutto. Questo poi lo associo ad un altro oggetto 
#e lo chiamo sempre y, quindi sto sovrascrivendo.
dim(y)
y <- y[1:36,]

#immaginiamo di voler vedere tutti i dati solo di una certa colonna
y$species
#il dollaro mi consente di estrarre una colonna dal mio dataframe, e R 
#mi restituisce un vettore.
mean(y$weight_g)
#se R trova un NA, il programma non può calcolare la media, bisogna specificare
mean(y$weight_g, na.rm = TRUE) #è nella funzione di media, na si scrive 
#a prescindere sempre in minuscolo.

