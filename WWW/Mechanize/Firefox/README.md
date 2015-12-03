Firefox needs the [MozRepl](https://addons.mozilla.org/de/firefox/addon/mozrepl/) add-on to work with
WWW::Mechanize::Firefox.

I had to start firefox with the `-repl` switch when I encountered this error
message: *Failed to connect to , problem connecting to "localhost", port 4242:
Es konnte keine Verbindung hergestellt werden, da der Zielcomputer die
Verbindung verweigerte. at C:/strawberry/perl/site/lib/MozRepl/Client.pm line
144*

## Notes

Doug Miles [Browser Automation with WWW::Mechanize::Firefox ](https://www.youtube.com/watch?v=_f33mpdXiXA)
  - The reason for using W::M::F is *JavaScript*.
  - Always use `$mech -> click(...., synchronize => 0);` for links that aren't going to load a new page.
  - Figuring out xpath expressions: Use Firebug, selected node and copy expression into
    clipboard.

Waiting for an element to «be there» (24:00)

    for (1 .. 60) { # 60: Wait max 1 minute.

      # Is the desired element in the dom?
      #   all=>1 -> don't blow up if it machtes more
      #   than one. (interested in at least one element)
      last if $mech -> xpath('//*[#id=...', all=>1);

      sleep(1);

    }



## Links

The [WebAutomation](https://github.com/ReneNyffenegger/WebAutomation) repository and its directory
The [WWW-Mechanize-Firefox](https://github.com/ReneNyffenegger/WebAutomation/tree/master/WWW-Mechanize-Firefox).

