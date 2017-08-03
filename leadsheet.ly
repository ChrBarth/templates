\version "2.18.2"
#(set-global-staff-size 14)
#(set-default-paper-size "a4")

\paper {
	% some layout-adjustments
	top-margin = 15
	bottom-margin = 15
	left-margin = 15
	right-margin = 15
	system-system-spacing #'padding = #5
	markup-system-spacing #'padding = #5
}

\header {
	title = "***title***"
	subtitle = "***subtitle***"
	composer = "***composer***"
	instrument = "Guitar"
	arranger = "***arranger***"
}

% the main melody:
melody = \relative c' {

\key e \minor
\clef treble

c4 d e8( f g4 )
a f g2
}

% the lyrics:
songlyrics = \lyricmode {

This is some
stu pid song

}

% and finally the harmonies/chords:
harmonies = \chordmode {

c2 e2:min
f2 g2

}


\score {
<<
    \new ChordNames {
    \set chordChanges = ##t
    \harmonies
    }
    \new Voice = "Vocals" {  \melody }
    \new Lyrics \lyricsto "Vocals" \songlyrics
>>
}
