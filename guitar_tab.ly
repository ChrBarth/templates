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

custom-tuning = \stringTuning <d a d' g' b' e''>

%%%%%%%%%
% music %
%%%%%%%%%

snippet = \relative c' {
	\key a \minor
    \time 4/4
    \tempo 4 = 120
	%\set TabStaff.minimumFret = #5
	\set TabStaff.restrainOpenStrings = ##t
	\override StringNumber #'transparent = ##t
        a,8_"Text" b c d e f g\4 c\3 e\2 a\1 ~ a2.\1
	}

\score {
	\new StaffGroup <<
		<<
		\new Staff { \clef "treble_8" <<
			\snippet
			>>
			}
		\new TabStaff {
			% here we set the tuning (for custom tuning there is an example below the \header section)
			\set TabStaff.stringTunings = #guitar-tuning
			% i like moderntab more than the other one :)
			\clef moderntab
			\snippet
			}
		>>
	>>
    % Create sheet and midi-output:
    \layout{}
    \midi{ \snippet }
}
