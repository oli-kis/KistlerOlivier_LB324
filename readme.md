# LB 324

## Aufgabe 2

Um pre-commit zu installieren muss man in Visual Studio Code ein neues Terminal öffnen und folgenden Befehl eingeben:

**pip install pre-commit**

Danach kann man ein File mit folgendem Namen erstellen:

**.pre-commit-config.yaml**

Nun kann man dieses File nach belieben konfigurieren, indem man github-repos hinzufügt, welche zum Beispiel Tests ausführen oder den Code automatisch formattieren.

## Aufgabe 4
Ich hatte Probleme mit Azure, weshalb ich mich dazu entschieden habe, meine App zu dockerisieren und sie auf Render.com zu veröffentlichen. Damit kann ich dasselbe Ergebnis wie mit Azure erzielen.
Ich habe also damit angefangen ein Dockerfile zu erstellen.

Ich konnte das Image dann mit dem Befehl «docker push olikis/lb324-olivierkistler:latest» auf mein DockerHub Repo pushen.
Nun konnte ich das Image als Basis für die Veröffentlichung auf Render.com angeben.

In der Aufgabe war gefordert, dass man das Passwort im Azure Key Vault sicher aufbewahrt. Glücklicherweise hatte Render ein ähnliches System, um geheime Variablen aufzubewahren. Dadurch konnte ich mein Passwort als Environment-Variable angeben und ganz normal im Code darauf zugreifen.

Danach war die Website auch schon live und ich konnte darauf zugreifen.

Ebenfalls war gefragt, dass bei jedem erfolgreichen merge auf den main-ast, die App neu deployed wird. In Azure gibt es dazu eine Möglichkeit, mit Docker und Render allerdings nicht. Meine Lösung war es dann, ein neues workflow-file zu erstellen. Das Image wird bei jeder pull-request auf den main-branch auf das Dockerhub gepusht. Auf Github gibt es die Möglichkeit geheime Variablen zu speichern. Diese habe ich genutzt, um mein Docker Passwort sicher zu bewahren. 
Docker würde die Funktion eigentlich auch unterstützen bei jedem neuen commit das Image neu zu erstellen. Diese Funktion ist leider aber kostenpflichtig.
 
Nun wird mein Image automatisch gepusht, wenn Änderungen in GitHub vorgenommen werden. Der nächste Schritt war es, Render zu automatisieren. Render stellt eine URL zur Verfügung, welche die App automatisch neu deployed, wenn sie aufgerufen wird. Ich konnte also nur noch ein Job hinzufügen, welcher die URL aufruft, nachdem das Docker-Image gepusht wurde. Daraus ergibt sich folgendes File und ein vollautomatischer Deployprozess. 

Link zu meinem Docker Image: [Image](https://hub.docker.com/repository/docker/olikis/lb324-olivierkistler/general)

Link zur Website (Könnte länger zum Laden brauchen, da Website nur bei Aufruf gestartet wird): [Website](https://lb324-olivierkistler.onrender.com)

Um Beweisbilder zu sehen, besehen Sie bitte meine Dokumentation

