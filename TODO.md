# TODO List

## Caption Handling Issues

- [ ] Lag beskrivelse av `captionLiveIngestLanguages` property - denne gir spiller info om hvilke undertekster som er tilgjengelig. Du kan ikke legge til flere språk annet enn det som man faktisk sender ut siden dette vil vises i avspiller.

- [x] Reconnect håndteres dårlig, det ser ikke ut som om retry teller nullstilles og hvis man først mister connection vil man aldri få den tilbake

## Notes

- The `captionLiveIngestLanguages` property should only contain languages that are actually being broadcast, as these will be shown to viewers in the player
- Reconnection logic has been fixed to properly handle connection drops and retry attempts
