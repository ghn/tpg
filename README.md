##API KEY
Claim your API key here http://www.tpg.ch/fr/web/open-data/donnees

##Usage

```bash
$ irb
$ require 'tpg'
$ tpg = Tpg.new("<my api key>")
$ puts tpg.get_next_departures :stopCode => "VUIL"
```

##Documentation

http://www.tpg.ch/web/7289503/5
