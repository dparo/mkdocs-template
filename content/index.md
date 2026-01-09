# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.


## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.


```plantuml
@startuml

!include <C4/C4_Context>

title "Diagramma di contesto - Diritto alla cancellazione dei dati personali (GDPR art. 17)"

'' Tagging does not work in the old C4 version included in code.servizi.gr-u.it
' AddElementTag("focus", $bgColor="purple", $borderColor="black", $borderStyle="DashedLine", $legendText="Componente oggetto di solutioning") -->
' AddRelTag("solution", $lineColor="purple", $textColor="purple", $lineStyle="bold", $legendText="Flussi integrazione soluzione GDPR") -->


System_Boundary(ext_boundary, "External Systems") {
    System_Ext(anag, "ANAG", "Sistema Anagrafica compagnia Unipol.")
}

System_Boundary(sftp_boundary, "File Transfer Layer") {
    System(sftp_server, "SFTP Server", "Server SFTP per il deposito sicuro dei file di tracciamento delle richieste di oblio.")
}

System_Boundary(mc_boundary, "Multicanalità") {
    System(mc_gdpr_oblio, "GDPR Oblio", "Sistema di gestione centralizzata per l'oblio dei dati personali", $tags="focus")
    System(mc_omnichannel, "Omnichannel", "Sistema gestore eventi.")
    System(mc_otp_cert_cont, "OTP / Cert. Contatti", "Sistema erogazione OTP, certificazione contatti.")
    System(mc_otp_fea, "OTP [FEA]", "Sistema erogazione OTP per firma elettronica avanzata [FEA].")
}


Rel(anag, sftp_server, "Deposita tracciato con richieste di oblio periodicamente via SFTP.", $sprite="&file")
Rel(sftp_server, mc_gdpr_oblio, "GDPR Oblio preleva i file depositati.", $tags="solution", $sprite="&file")
Rel(mc_gdpr_oblio, mc_omnichannel, "Offuscamento dati personali utenti.", $tags="solution")
Rel(mc_gdpr_oblio, mc_otp_cert_cont, "Offuscamento dati personali utenti.", $tags="solution")
Rel(mc_gdpr_oblio, mc_otp_fea, "Offuscamento dati personali utenti.", $tags="solution")
Rel(mc_gdpr_oblio, sftp_server, "Copia il file processato in cartella archivio per storicizzazione.", $tags="solution", $sprite="&file")


SHOW_LEGEND()

@enduml
```

