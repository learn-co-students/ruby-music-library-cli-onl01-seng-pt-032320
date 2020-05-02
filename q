
[1mFrom:[0m /mnt/c/Users/Trump/dev/flatiron/labs/ruby-music-library-cli-onl01-seng-pt-032320/lib/MusicLibraryController.rb @ line 83 MusicLibraryController#list_songs_by_artist:

    [1;34m79[0m: [32mdef[0m [1;34mlist_songs_by_artist[0m
    [1;34m80[0m:     puts [31m[1;31m"[0m[31mPlease enter the name of an artist:[1;31m"[0m[31m[0m
    [1;34m81[0m:     artist_input = gets.strip
    [1;34m82[0m: 
 => [1;34m83[0m:     binding.pry
    [1;34m84[0m: 
    [1;34m85[0m:     query = [1;34;4mSong[0m.all.select {|song| song.artist == artist_input}
    [1;34m86[0m:     artist_list = query.sort_by(&[33m:song[0m)
    [1;34m87[0m: 
    [1;34m88[0m:     artist_list.each.with_index([1;34m1[0m) [32mdo[0m |song, ind|
    [1;34m89[0m:     puts [31m[1;31m"[0m[31m#{ind}[0m[31m. #{song.name}[0m[31m - #{song.genre.name}[0m[31m[1;31m"[0m[31m[0m
    [1;34m90[0m:     [32mend[0m
    [1;34m91[0m: [32mend[0m

