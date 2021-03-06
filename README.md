# Stardew Valley Downgrader

Stardew Valley Downgrader is a Batch script to automate downloading older versions of Stardew Valley for speedrunning using the native Steam Console.
<details>
  <summary>Screenshots</summary>
 
  ![Demo Screenshot](https://user-images.githubusercontent.com/14987609/168975360-cd044c11-7e7a-470f-9163-2758249e7061.png)
 
  ![Demo Screenshot](https://user-images.githubusercontent.com/14987609/168978055-1c1c41ee-a37f-4852-970b-7cd4be13f5c6.png)
</details>


## Usage:
Download the [latest version](https://github.com/Ryah/SDV-Downgrader/releases/tag/v2.0.0) and double click the .bat file

## Todo:
  * ✗ Find a way to verify depot download without running DepotDownloader twice. [@done by removing DepotDownloader(5-18-22 1:46)](https://github.com/Ryah/SDV-Downgrader/commit/9c3405322464a407e34d1f5a6b6f68ecbc007ec4)
  * ✔ Stop script from downloading all of the versions no matter what version is chosen. [@done(21-10-15 12:10)](https://github.com/Ryah/SDV-Downgrader/commit/9ed20abea5a7d8035c0b48c10d37ac2fc858604e#diff-162634f9851b49e6a62c3e03663a495bb401505fd800614c68084ebfa3715346R123)
  * ✔ Make header show in main menu (gotta have those aesthetics) [@done(21-10-15 12:24)](https://github.com/Ryah/SDV-Downgrader/commit/4e987584622036022dcae0dfd94345103455b547#diff-162634f9851b49e6a62c3e03663a495bb401505fd800614c68084ebfa3715346)
  * ☐ Make downloader work for other games (maybe pull a list of depots from AppID and make it selectable?).
    * Would have to update from CmdMenuSel to GetInput batch plugin for that to work properly.
  * ☐ Possibly make this work on Mac and Linux
    * Requires complete port to either Electron or Mono
    * Considering a Giraffe knows more Mono than me, probably Electron. I can brand it as ":sparkles:Modern:sparkles: and :zany_face:Hackable:zany_face: "
    * Could also make 3 separate versions but I have no clue how to develop for Mac.

## Notes:
CmdMenuSel reports the option selected in the %ERRORCODE% variable. If you wish to add manifests to this, Add onto the menu list with the correct errorcode and label, then put your code in its own label UNDER the others. Make sure to end the block with ```goto :eof```

## Credits:
[CmdMenuSel](https://github.com/TheBATeam/CmdMenuSel-by-Judago)

---

### _**I don't know why I wrote this in Batch. I don't even use Windows. I use Pop_OS. I had to use WINE just to bugtest this. I was not prepared.**_
